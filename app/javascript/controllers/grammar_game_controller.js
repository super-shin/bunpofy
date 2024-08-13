import { Controller } from "@hotwired/stimulus";
import { GoogleGenerativeAI } from "@google/generative-ai";

// Connects to data-controller="game"
export default class extends Controller {
	static targets = [
		"optionElement",
		"answerElement",
		"wordElement",
		"checkElement",
		"nextElement",
		"buttonElement",
	];
	connect() {
		console.log(this.element.dataset.valueWordsArray);
		this.game_xp = 0;
		this.studentAnswersArray = [];
		this.gameId = this.element.dataset.valueGameId;
		this.submissionId = this.element.dataset.valueSubmissionId;
		this.geminiKey = this.element.dataset.valueKey;
		this.successAudio = new Audio(this.element.dataset.valueAudioSuccess);
		this.failAudio = new Audio(this.element.dataset.valueAudioFail);
		this.wordsArray = JSON.parse(this.element.dataset.valueWordsArray);
		this.loadingElement = document.querySelector("#loading-element");
		this.gameElement = document.querySelector("#game-element");
		this.loadData();
	}

	async loadData() {
		await this.callGemini();
		this.loadingElement.classList.add("d-none");
		this.gameElement.classList.remove("d-none");
		this.currentSentenceIndex = 0;
		this.loadGame();
	}

	async callGemini() {
		const number_sentences = this.wordsArray.length;
		const API_KEY = this.geminiKey;
		const genAI = new GoogleGenerativeAI(API_KEY);
		const model = genAI.getGenerativeModel({ model: "gemini-1.5-flash" });
		let prompt = `
		Create ${number_sentences} simple sentences in English for Japanese Junior High Students.
		Each sentence should use one of the following words: (${this.wordsArray.join(
			", "
		)}).The sentences should be straightforward and not interchangeable in meaning. The sentence should not have more than 10 words. 
  Ensure that each sentence clearly conveys its intended meaning and does not allow for the words to be interchanged without changing the context.
	Please format the response as a JSON array with the following structure (Dont write anything before and after "[]"):
		[{"Sentence": "string"},
			{
				"Sentence": "string"
			},
			...
		]
	`;
		let result = await model.generateContent(prompt);
		this.correctSentencesArray = JSON.parse(result.response.text());
		console.log(this.correctSentencesArray);
		this.shuffleWords(this.correctSentencesArray);
	}

	shuffleWords(correctSentencesArray) {
		this.sentenceTokenizeArray = [];
		this.sentenceTokenizeShuffledArray = [];
		correctSentencesArray.forEach((sentence) => {
			this.sentenceTokenize = sentence.Sentence;
			this.sentenceTokenize = this.sentenceTokenize.trim();
			// Remove trailing punctuation
			this.sentenceTokenize = this.sentenceTokenize.replace(
				/([!.?])(?=[^a-zA-Z]*$)/g,
				""
			);
			// Tokenize the sentence
			this.sentenceTokenize = this.sentenceTokenize.match(/[\w']+|[,.!?]/g);
			this.sentenceTokenizeShuffled = [...this.sentenceTokenize];
			this.sentenceTokenizeArray.push(this.sentenceTokenize);
			this.sentenceTokenizeShuffled = this.shuffleArray(
				this.sentenceTokenizeShuffled
			);
			console.log(this.sentenceTokenizeShuffled);
			this.sentenceTokenizeShuffledArray.push(this.sentenceTokenizeShuffled);
		});
	}

	shuffleArray(array) {
		// Fisher-Yates shuffle algorithm
		let currentIndex = array.length;

		// While there remain elements to shuffle...
		while (currentIndex != 0) {
			// Pick a remaining element...
			let randomIndex = Math.floor(Math.random() * currentIndex);
			currentIndex--;

			// And swap it with the current element.
			[array[currentIndex], array[randomIndex]] = [
				array[randomIndex],
				array[currentIndex],
			];
		}
		return array;
	}

	loadGame() {
		this.answerElementTarget.innerHTML = "";
		this.optionElementTarget.innerHTML = "";
		this.buttonElementTarget.innerHTML = "";
		this.answer = this.sentenceTokenizeArray[this.currentSentenceIndex];
		this.sentenceTokenizeShuffledArray[this.currentSentenceIndex].forEach(
			(word) => {
				this.optionElementTarget.insertAdjacentHTML(
					"beforeend",
					`<div class="btn-option-grammar-game mx-2 mb-2 my-1" data-action="click->grammar-game#select" data-grammar-game-target="wordElement" style="cursor:pointer">${word}</div>`
				);
			}
		);
		this.buttonElementTarget.style.backgroundColor = "";
		this.buttonElementTarget.insertAdjacentHTML(
			"beforeend",
			`<button type="button" class="button-check-grammar-game ms-auto" data-grammar-game-target="checkElement" data-action="click->grammar-game#check">Check</button>`
		);
		this.fullSentence = ""; // Reseting value inside FullSentece for new Game
		this.checkElementTarget.disabled = false;
		this.checkElementTarget.classList.add("disabled");
		this.checkElementTarget.style.cursor = "pointer";
	}

	select(event) {
		const parent = event.currentTarget.parentElement;
		if (this.checkElementTarget.classList.contains("disabled")) {
			this.checkElementTarget.classList.remove("disabled");
		}
		if (parent.classList.contains("options-container")) {
			this.answerElementTarget.insertAdjacentHTML(
				"beforeend",
				event.currentTarget.outerHTML
			);
			this.createShadow(event.currentTarget);
		} else {
			this.removeShadow(event.currentTarget);
			event.currentTarget.remove();
		}
		this.fullSentence = "";
		this.answerElementTarget.querySelectorAll("div").forEach((element) => {
			this.fullSentence += element.innerText;
		});
	}

	check(event) {
		// Changes the progress bar
		this.progressBar();
		// Update the array with the Student Answers
		this.studentAnswersArray.push(this.answer.join(" "));
		// Changes the text between Next and Next Challenge
		this.buttonElementTarget.innerHTML = "";
		const buttonText =
			this.currentSentenceIndex === this.correctSentencesArray.length - 1
				? "Next Challenge"
				: "Next";
		this.buttonElementTarget.insertAdjacentHTML(
			"beforeend",
			`<button type="button" class="button-check-grammar-game ms-auto" data-grammar-game-target="nextElement" data-action="click->grammar-game#next">${buttonText}</button>`
		);
		this.buttonElementTarget.insertAdjacentHTML(
			"afterbegin",
			`<div class="correct-sentence-container d-flex flex-wrap justify-content-start align-items-center p-3">${
				this.correctSentencesArray[this.currentSentenceIndex].Sentence
			}</div>`
		);

		// Disable events of words(options)
		this.wordElementTargets.forEach((element) => {
			element.classList.add("disabled");
			element.style.cursor = "default";
		});
		// Validates the game
		if (this.fullSentence === this.answer.join("")) {
			// Update the xp gaining in this game
			this.game_xp += 100 / this.wordsArray.length;
			document.querySelector(".grammar-game-xp-number").innerText =
				this.game_xp;
			const levelUpImage = document.querySelector(".grammar-game-level-up");
			this.buttonElementTarget.style.backgroundColor = "#1b4332";
			this.successAudio.play();
			// Trigger the shine and disappear effect
			levelUpImage.classList.add("active");
			setTimeout(() => {
				levelUpImage.classList.remove("active");
			}, 1500); // duration of the shine effect
		} else {
			const brokenSwordImage = document.querySelector(
				".grammar-game-broken-sword"
			);
			this.buttonElementTarget.style.backgroundColor = "#250902";
			this.failAudio.play();
			// Trigger the shine and disappear effect
			brokenSwordImage.classList.add("active");
			setTimeout(() => {
				brokenSwordImage.classList.remove("active");
			}, 1500); // duration of the shine effect
		}
	}

	progressBar() {
		const progress =
			((this.currentSentenceIndex + 1) / this.correctSentencesArray.length) *
			100;
		const progressBarElement = document.querySelector("#current-progress-bar");
		progressBarElement.style.width = progress + "%";
		progressBarElement.classList.add("glow");

		// Remove glow in 500ms
		setTimeout(() => {
			progressBarElement.classList.remove("glow");
		}, 500);
	}

	createShadow(element) {
		element.classList.add("disabled");
		element.style.backgroundColor = "grey";
		element.style.color = "transparent";
		element.style.userSelect = "none";
	}

	removeShadow(element) {
		this.optionElementTarget
			.querySelectorAll("div")
			.forEach((optionElement) => {
				if (optionElement.innerText === element.innerText) {
					optionElement.classList.remove("disabled");
					optionElement.style.backgroundColor = "#ffc506";
					optionElement.style.color = "black";
					optionElement.style.userSelect = "auto";
					return true;
				}
			});
	}

	next(event) {
		if (this.currentSentenceIndex === this.correctSentencesArray.length - 1) {
			// Go to the next Game
			const dataToUpdate = {
				score: this.game_xp,
				question: this.sentenceTokenizeShuffledArray.map((subArray) =>
					subArray.join(" ")
				),
				correct_answer: this.correctSentencesArray.map(
					(subArray) => subArray.Sentence
				),
				student_answer: this.studentAnswersArray,
			};
			// Saving data in DB
			fetch(`/student/submissions/${this.submissionId}/games/${this.gameId}`, {
				method: "PATCH",
				headers: {
					"Content-Type": "application/json",
					"X-CSRF-Token": document
						.querySelector('meta[name="csrf-token"]')
						.getAttribute("content"),
				},
				body: JSON.stringify(dataToUpdate),
			})
				.then((response) => {
					if (response.ok) {
						return response.text(); // If you're expecting a Turbo Stream response
					} else {
						throw new Error("Failed to update the game");
					}
				})
				.then((turboStreamResponse) => {
					// Turbo will automatically process the Turbo Stream response and update the DOM
					console.log("Game updated successfully!");
				})
				.catch((error) => {
					console.error(error);
				});
			window.location.href = "/student/challenges";
		} else {
			this.currentSentenceIndex++;
			this.loadGame();
		}
	}
}
