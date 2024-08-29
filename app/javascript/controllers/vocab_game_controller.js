import { Controller } from "@hotwired/stimulus";
import { GoogleGenerativeAI } from "@google/generative-ai";
import { CountUp } from "countup.js";

// Connects to data-controller="game"
export default class extends Controller {
	static targets = [
		"optionElement",
		"answerElement",
		"wordElement",
		"checkElement",
		"nextElement",
		"buttonElement",
		"audioElement",
		"questionWord",
	];
	connect() {
		console.log(this.element.dataset.valueWordsArray);
		this.game_xp = 0;
		this.studentAnswersArray = [];
		this.gameId = this.element.dataset.valueGameId;
		this.submissionId = this.element.dataset.valueSubmissionId;
		this.levelNumber = this.element.dataset.valueLevelNumber;
		this.experience = this.element.dataset.valueExperience;
		this.geminiKey = this.element.dataset.valueKey;
		this.audioIcon = this.element.dataset.valueAudioIcon;
		this.successAudio = new Audio(this.element.dataset.valueAudioSuccess);
		this.failAudio = new Audio(this.element.dataset.valueAudioFail);
		this.cutAudio = new Audio(this.element.dataset.valueAudioCut);
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
		// 	const number_sentences = this.wordsArray.length;
		// 	const genAI = new GoogleGenerativeAI(this.geminiKey);
		// 	const model = genAI.getGenerativeModel({ model: "gemini-1.5-flash" });
		// 	let prompt = `
		// 	Create 16 simple arrays with the name of the emoji and 1 Unicode HTML Presentation Emoji in each array. For example: Elephant, 🐘
		// The emojis should all be different animals. There should only be 1 Presentation Emoji per array. The emojis all must pass this validation in javascript: match(/[\w']+|[,.!?]|[\p{Emoji_Presentation}]/gu)
		// Please format the response as a JSON array with the following structure (Dont write anything before and after "[]"):
		// 	[{"Sentence": "Name_of_emoji, Presentation Emoji"}, {"Sentence": "Name_of_emoji, Presentation Emoji"}, etc]
		// `;
		// 	let result = await model.generateContent(prompt);
		// 	this.correctSentencesArray = JSON.parse(result.response.text());
		// 	console.log(this.correctSentencesArray);

		this.correctSentencesArray = [
			{
				Sentence: "Elephant, 🐘",
			},
			{
				Sentence: "Tiger, 🐅",
			},
			{
				Sentence: "Lion, 🦁",
			},
			{
				Sentence: "Fox, 🦊",
			},
			{
				Sentence: "Wolf, 🐺",
			},
			{
				Sentence: "Bear, 🐻",
			},
			{
				Sentence: "Giraffe, 🦒",
			},
			{
				Sentence: "Zebra, 🦓",
			},
			{
				Sentence: "Monkey, 🐒",
			},
			{
				Sentence: "Kangaroo, 🦘",
			},
			{
				Sentence: "Penguin, 🐧",
			},
			{
				Sentence: "Dolphin, 🐬",
			},
			{
				Sentence: "Whale, 🐳",
			},
			{
				Sentence: "Shark, 🦈",
			},
			{
				Sentence: "Turtle, 🐢",
			},
			{
				Sentence: "Snake, 🐍",
			},
		];

		this.optionsArray = this.correctSentencesArray.slice(4);
		this.correctSentencesArray = this.correctSentencesArray.slice(0, 4);
		this.shuffleWords(this.correctSentencesArray);
		this.filterWords(this.correctSentencesArray);
		this.shuffleOptionsArray(this.optionsArray);
		console.log(this.correctSentencesArray);
		console.log(this.optionsArray);
	}

	filterWords(correctSentencesArray) {
		this.fullWordsArray = [];
		correctSentencesArray.forEach((sentence) => {
			this.wordTokenize = sentence.Sentence;
			this.wordTokenize = this.wordTokenize.trim();
			// Remove trailing punctuation
			this.wordTokenize = this.wordTokenize.replace(/[^\p{L}\p{N}]+/gu, "");
			this.wordTokenize = this.wordTokenize.replace(/[\s,]+/g, "");
			this.fullWordsArray.push(this.wordTokenize);
			console.log(this.fullWordsArray);
		});
	}

	shuffleWords(correctSentencesArray) {
		this.sentenceTokenizeArray = [];
		this.sentenceTokenizeShuffledArray = [];
		correctSentencesArray.forEach((sentence) => {
			this.sentenceTokenize = sentence.Sentence;
			this.sentenceTokenize = this.sentenceTokenize.trim();
			// Remove trailing punctuation
			//this.sentenceTokenize = this.sentenceTokenize.replace(
			//	/([!.?])(?=[^a-zA-Z]*$)/g,
			//	""
			//);
			this.sentenceTokenize = this.sentenceTokenize.replace(
				/[^\p{Emoji_Presentation}]/gu,
				""
			);
			// Tokenize the sentence
			this.sentenceTokenize = this.sentenceTokenize.match(
				/[\w']+|[,.!?]|[\p{Emoji_Presentation}]/gu
			);
			//this.sentenceTokenize = this.sentenceTokenize.match(/[\w']+|[,.!?]/g);
			this.sentenceTokenizeShuffled = [...this.sentenceTokenize];
			this.sentenceTokenizeArray.push(this.sentenceTokenize);
			this.sentenceTokenizeShuffled = this.shuffleArray(
				this.sentenceTokenizeShuffled
			);
			console.log(this.sentenceTokenizeShuffled);
			this.sentenceTokenizeShuffledArray.push(this.sentenceTokenizeShuffled);
		});
	}

	shuffleOptionsArray(optionsArray) {
		this.emojiTokenizeArray = [];
		this.emojiTokenizeShuffledArray = [];
		optionsArray.forEach((sentence) => {
			this.emojiTokenize = sentence.Sentence;
			this.emojiTokenize = this.emojiTokenize.trim();
			this.emojiTokenize = this.emojiTokenize.replace(
				/[^\p{Emoji_Presentation}]/gu,
				""
			);
			this.emojiTokenize = this.emojiTokenize.match(
				/[\w']+|[,.!?]|[\p{Emoji_Presentation}]/gu
			);
			this.emojiTokenizeShuffled = [...this.emojiTokenize];
			this.emojiTokenizeArray.push(this.emojiTokenize);
			this.emojiTokenizeShuffled = this.shuffleArray(
				this.emojiTokenizeShuffled
			);
			console.log(this.emojiTokenizeShuffled);
			this.emojiTokenizeShuffledArray.push(this.emojiTokenizeShuffled);
			this.emojisArray = this.emojiTokenizeShuffledArray.flat();
			console.log(this.emojisArray);
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

	shuffleButtons() {
		const container = this.optionElementTarget; // Select the container element
		const buttons = Array.from(container.querySelectorAll(".option-div")); // Get all buttons

		// Fisher-Yates shuffle algorithm
		for (let i = buttons.length - 1; i > 0; i--) {
			const j = Math.floor(Math.random() * (i + 1));
			[buttons[i], buttons[j]] = [buttons[j], buttons[i]]; // Swap elements
		}

		// Clear the container
		container.innerHTML = "";

		// Append shuffled buttons to the container
		buttons.forEach((button) => container.appendChild(button));
	}

	loadGame() {
		//let quizContainer = document.getElementById("container");
		let randomEmoji = this.shuffleArray(this.emojisArray.slice()).slice(0, 3);
		this.answerElementTarget.innerHTML = "";
		this.optionElementTarget.innerHTML = "";
		this.buttonElementTarget.innerHTML = "";
		this.answer = this.sentenceTokenizeArray[this.currentSentenceIndex];
		this.questionWord = this.fullWordsArray;

		// Select the h2 element using its data attribute
		const questionWordElement = document.querySelector(
			'[data-vocab-game-target="questionWord"]'
		);

		// Change the text content
		questionWordElement.textContent = `${
			this.questionWord[this.currentSentenceIndex]
		}`;

		// Remove existing answerElement if present
		const answerElement = document.querySelector(
			'[data-vocab-game-target="answerElement"]'
		);
		if (answerElement) {
			answerElement.remove();
		}

		// Add buttons to optionElementTarget
		this.sentenceTokenizeShuffledArray[this.currentSentenceIndex].forEach(
			(word) => {
				this.optionElementTarget.insertAdjacentHTML(
					"beforeend",
					`
        <button class="option-div" data-action="click->vocab-game#select" data-vocab-game-target="wordElement" style="cursor:pointer">
          <span class="emoji" data-vocab-game-target="answerElement">${word}</span>
        </button>
        `
				);
			}
		);

		randomEmoji.forEach((word) => {
			console.log(word);
			const matchedOption = this.optionsArray.find((option) =>
				option.Sentence.includes(word)
			);
			const result = matchedOption
				? matchedOption.Sentence.split(", ")[0]
				: null;
			console.log(result);
			this.optionElementTarget.insertAdjacentHTML(
				"beforeend",
				`
        <button class="option-div" id="flipCard" data-action="click->vocab-game#select" data-vocab-game-target="wordElement" style="cursor:pointer" data-option="${word}" data-back="${result}">
          <span class="emoji">${word}</span>
        </button>
        `
			);
		});

		// Shuffle buttons
		this.shuffleButtons();

		// Set up check button and styles
		this.buttonElementTarget.style.backgroundColor = "";
		this.buttonElementTarget.insertAdjacentHTML(
			"beforeend",
			`<button type="button" class="button-check-vocab-game ms-auto" data-vocab-game-target="checkElement" data-action="click->vocab-game#check">Check</button>`
		);
		this.fullSentence = ""; // Resetting value inside FullSentence for new Game
		this.checkElementTarget.disabled = false;
		this.checkElementTarget.classList.add("disabled");
		this.checkElementTarget.style.cursor = "pointer";
	}

	select(event) {
		const clickedButton = event.currentTarget;

		// Remove highlight from previously selected buttons
		this.optionElementTarget
			.querySelectorAll(".option-div")
			.forEach((button) => {
				button.classList.remove("highlighted");
			});

		// Add highlight to the clicked button
		clickedButton.classList.add("highlighted");

		const parent = event.currentTarget.parentElement;
		if (this.checkElementTarget.classList.contains("disabled")) {
			this.checkElementTarget.classList.remove("disabled");
		}
		if (parent.classList.contains("options-container")) {
			//this.answerElementTarget.insertAdjacentHTML(
			//	"beforeend",
			//	event.currentTarget.outerHTML
			//);
			//this.createShadow(event.currentTarget);
		} else {
			//this.removeShadow(event.currentTarget);
			event.currentTarget.remove();
		}
		this.fullSentence = [];

		const word = event.currentTarget.querySelector(".emoji").textContent.trim();

		// Add the word to the fullSentence array
		this.fullSentence.push(word);

		//	this.answerElementTarget.querySelectorAll("button").forEach((element) => {
		//		this.fullSentence.push(element.innerText);
		//	});
	}

	check(event) {
		// Changes the progress bar
		this.progressBar();

		// Update the array with the Student Answers
		this.studentAnswersArray.push(this.fullSentence.join(" "));
		const sentence =
			this.correctSentencesArray[this.currentSentenceIndex].Sentence;
		console.log(sentence);

		const emojiToFind = this.studentAnswersArray[0];
		this.studentAnswersWord = this.optionsArray.filter((obj) =>
			obj.Sentence.includes(emojiToFind)
		);
		console.log(this.studentAnswersWord);

		//const sentence = this.studentAnswersWord[0].Sentence;

		this.filteredSentence = sentence.replace(/[^a-zA-Z\s]/g, "");

		// Changes the text between Next and Next Challenge
		this.buttonElementTarget.innerHTML = "";
		const buttonText =
			this.currentSentenceIndex === this.correctSentencesArray.length - 1
				? "Finish"
				: "Next";
		this.buttonElementTarget.insertAdjacentHTML(
			"beforeend",
			`<button type="button" class="button-check-vocab-game ms-auto" data-vocab-game-target="nextElement" data-action="click->vocab-game#next">${buttonText}</button>`
		);
		this.buttonElementTarget.insertAdjacentHTML(
			"afterbegin",
			`<div class="correct-sentence-container-grammar-game d-flex flex-wrap justify-content-start align-items-center p-3"><p class="mt-1">
			<div class="correct-sentence-tooltip-grammar-game"><p>Correct Word:</p></div>
      <i class="fa-solid fa-volume-high me-1" id="audio-icon-grammar-game" data-vocab-game-target="audioElement" data-action="click->vocab-game#audio"></i>
      ${this.filteredSentence}
      </div>`
		);

		// Reproduce the sentence audio
		this.audio();

		this.wordElementTargets.forEach((element) => {
			element.removeAttribute("data-action");
			//element.classList.add("disabled");
			//element.style.cursor = "default";
		});

		// Validate the game
		if (this.fullSentence.join("") === this.answer.join("")) {
			// Sum experience animation
			this.game_xp += 50 / this.wordsArray.length;
			const options = {
				duration: 3,
			};
			const xpSumElement = document.querySelector("#vocab-game-xp-number-sum");
			const xpSumPlusElement = document.querySelector("#vocab-game-xp-plus");
			let xpSum = new CountUp(
				xpSumElement,
				50 / this.wordsArray.length,
				options
			);
			if (!xpSum.error) {
				xpSumPlusElement.classList.remove("d-none");
				xpSum.start();
				setTimeout(() => {
					// Update the xp gaining in this game after animation finishes
					document.querySelector(".vocab-game-xp-number").innerText =
						this.game_xp;
				}, options.duration * 1000);
				setTimeout(() => {
					xpSumPlusElement.classList.add("d-none");
					xpSumElement.innerText = "";
				}, options.duration * 1000 + 500);
			} else {
				console.error(xpSum.error);
			}

			// Update the xp gaining in this game
			const levelUpImage = document.querySelector(".vocab-game-level-up");
			this.buttonElementTarget.style.backgroundColor = "#1b4332";
			this.successAudio.play();
			// Trigger the shine and disappear effect
			levelUpImage.classList.add("active");
			setTimeout(() => {
				levelUpImage.classList.remove("active");
			}, 1500); // duration of the shine effect
		} else {
			const brokenSwordImage = document.querySelector(
				".vocab-game-broken-sword"
			);
			this.buttonElementTarget.style.backgroundColor = "#250902";
			this.failAudio.play();
			// Trigger the shine and disappear effect
			brokenSwordImage.classList.add("active");
			setTimeout(() => {
				brokenSwordImage.classList.remove("active");
			}, 2500); // duration of the shine effect
		}

		// Apply styles to indicate correct and incorrect answers
		this.applyAnswerStyles();

		console.log("Full Sentence:", this.fullSentence);
		console.log("Answer:", this.answer);

		if (this.fullSentence.join("") === this.answer.join("")) {
			console.log("Correct answer! Awarding XP...");
			// Your existing XP logic
		} else {
			console.log("Incorrect answer.");
			// Your existing fail logic
		}
	}

	audio() {
		const sentence =
			this.correctSentencesArray[this.currentSentenceIndex].Sentence;
		const filteredSentence = sentence.replace(/[^a-zA-Z\s]/g, "");
		const utterance = new SpeechSynthesisUtterance(filteredSentence);
		window.speechSynthesis.speak(utterance);

		// if (this.fullSentence.join("") === this.answer.join("")) {
		//   const utterance = new SpeechSynthesisUtterance(
		//     filteredSentence
		//   );
		//   window.speechSynthesis.speak(utterance);
		// } else {
		//   const utterance = new SpeechSynthesisUtterance(
		//     this.fullSentence
		//   );
		//   window.speechSynthesis.speak(utterance);
		// }
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

	applyAnswerStyles() {
		// Retrieve the correct sentence and correct words
		const correctSentence =
			this.correctSentencesArray[this.currentSentenceIndex].Sentence;
		const correctWords = correctSentence.match(
			/[\w']+|[,.!?]|[\p{Emoji_Presentation}]/gu
		);

		// Clear previous styles
		this.optionElementTarget
			.querySelectorAll(".option-div")
			.forEach((button) => {
				button.classList.remove("correct", "incorrect");
			});

		// Apply styles based on correctness
		this.optionElementTarget
			.querySelectorAll(".option-div")
			.forEach((button) => {
				const buttonWord = button.querySelector(".emoji").textContent.trim();
				if (correctWords.includes(buttonWord)) {
					button.classList.add("correct");
				} else if (this.fullSentence.includes(buttonWord)) {
					button.classList.add("incorrect");
				}
			});

		document.querySelectorAll(".option-div:not(.correct)").forEach((card) => {
			card.addEventListener("click", function (event) {
				// Stop the event from propagating
				event.stopPropagation();

				// Flip the card on click
				card.classList.add("flipped");

				// Hide the emoji initially
				const emoji = card.querySelector(".emoji");
				if (emoji) {
					emoji.style.visibility = "hidden"; // Hide the emoji
				}

				// Function to reset the card
				function resetCard() {
					card.classList.remove("flipped");
					document.removeEventListener("click", resetCard);
				}

				// Wait for the next click event outside the card to reset it
				setTimeout(() => {
					document.addEventListener("click", resetCard);
				}, 0);

				// Prevent the immediate reset if clicking on the card again
				card.addEventListener(
					"click",
					function (event) {
						event.stopPropagation();
					},
					{ once: true }
				);
			});
		});
	}

	next(event) {
		document
			.getElementById("flipCard")
			.addEventListener("click", function (event) {
				event.stopPropagation(); // Prevent the immediate document click from firing
				const card = this;
				card.classList.remove("flipped");
			});

		if (this.currentSentenceIndex === this.correctSentencesArray.length - 1) {
			// Go to the next Game
			const dataToUpdate = {
				score: this.game_xp,
				questions: this.sentenceTokenizeShuffledArray.map(
					(sentence, index) => ({
						student_answer: this.studentAnswersArray[index] || "",
						correct_answer: this.correctSentencesArray[index].Sentence,
						options: sentence,
					})
				),
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
			this.levelUp();
		} else {
			this.currentSentenceIndex++;
			this.loadGame();
		}
	}

	levelUp() {
		const levelImage = document.querySelector(".level-pentagon-grammar-game");
		const shuriken = document.querySelector(".shuriken-grammar-game");
		const whiteFlash = document.querySelector(".white-flash-grammar-game");
		const levelNumber = document.querySelector(
			".level-pentagon-number-grammar-game"
		);
		const levelUpMessage = document.querySelector(
			".level-pentagon-title-grammar-game"
		);
		this.answerElementTarget.innerHTML = "";
		this.answerElementTarget.classList.remove("border");
		this.optionElementTarget.innerHTML = "";
		document.querySelector(".text-center").innerText = "";
		this.gameElement.classList.add("d-none");
		levelImage.classList.add("active");
		setTimeout(() => {
			shuriken.classList.add("active");
			whiteFlash.classList.add("active");
			setTimeout(() => this.cutAudio.play(), 50);
		}, 500);
		setTimeout(() => {
			shuriken.classList.remove("active");
			whiteFlash.classList.remove("active");
			levelUpMessage.classList.add("active");
			levelNumber.innerText = `7`;
		}, 2100);

		setTimeout(() => {
			window.location.href = "/student/challenges";
		}, 6000);
	}
}
