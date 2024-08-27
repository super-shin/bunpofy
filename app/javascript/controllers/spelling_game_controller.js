import { Controller } from "@hotwired/stimulus";
import { CountUp } from "countup.js";

// Connects to data-controller="spelling-game"
export default class extends Controller {
	static values = {
		wordsArray: Array,
		correctSound: String,
		incorrectSound: String,
		jpwordsArray: Array,
		gameId: String,
		submissionId: String,
	};
	static targets = ["input", "results", "buttonElement"];

	connect() {
		this.emptyUserArray = [];
		this.emptyCorrectArray = [];
		this.generateRandomWord();
		this.correctSound = new Audio(this.correctSoundValue);
		this.incorrectSound = new Audio(this.incorrectSoundValue);
		this.hintWord();
		this.score = 0;
		this.maxAttempts = 2;
		this.currentAttempt = 0;
	}

	generateRandomWord() {
		this.resultsTarget.innerHTML = "";
		if (this.currentAttempt >= this.maxAttempts) {
			this.gameOver();
			return;
		}

		let randomIndex;
		do {
			randomIndex = Math.floor(Math.random() * this.wordsArrayValue.length);
		} while (
			this.emptyCorrectArray.includes(this.wordsArrayValue[randomIndex])
		);

		this.randomWord = this.wordsArrayValue[randomIndex];
		this.jpwords = this.jpwordsArrayValue[randomIndex];

		this.emptyCorrectArray.push(this.randomWord);
		console.log(this.emptyUserArray);
		console.log(this.emptyCorrectArray);
	}

	correctSpelling(event) {
		event.preventDefault();
		document.getElementById("hint").innerHTML = "";
		const resultElement = this.resultsTarget;
		const userInput = this.inputTarget.value.trim().toLowerCase();
		if (userInput === this.randomWord.toLowerCase()) {
			this.emptyUserArray.push(userInput);
			this.resultsTarget.style.backgroundColor = "#1b4332";
			this.correctSound.play();
			const levelUpImage = document.querySelector(".grammar-game-level-up");
			levelUpImage.classList.add("active");
			setTimeout(() => {
				levelUpImage.classList.remove("active");
			}, 1500);
			this.score += 50;
			this.currentAttempt++;
			this.progressBar();
			const options = {
				duration: 3,
			};
			const xpSumElement = document.querySelector(
				"#grammar-game-xp-number-sum"
			);
			const xpSumPlusElement = document.querySelector("#grammar-game-xp-plus");
			let xpSum = new CountUp(
				xpSumElement,
				100 / this.wordsArrayValue.length,
				options
			);
			if (!xpSum.error) {
				xpSumPlusElement.classList.remove("d-none");
				xpSum.start();
				setTimeout(() => {
					// Update the xp gaining in this game after animation finishes
					document.querySelector(".grammar-game-xp-number").innerText =
						this.score;
				}, options.duration * 1000);
				setTimeout(() => {
					xpSumPlusElement.classList.add("d-none");
					xpSumElement.innerText = "";
				}, options.duration * 1000 + 500);
			} else {
				console.error(xpSum.error);
			}
			const buttonText =
				this.currentAttempt === this.maxAttempts ? "Next Challenge" : "Next";
			resultElement.innerHTML = `
        <div class="d-flex align-items-center justify-content-center" style="margin: 0px 200px;">
          <i class="fa fa-check-circle" aria-hidden="true"></i>
          <p id="correct">
          Correct, You did great!</p>
        </div>
        <button type="button" class="button-check-grammar-game ms-auto" id="next-word-button">${buttonText}</button>
      `;
			document
				.getElementById("next-word-button")
				.addEventListener("click", () => {
					this.resultsTarget.style.backgroundColor = "";
					this.inputTarget.value = "";
					this.generateRandomWord();
					this.hintWord();
				});
		} else {
			this.resultsTarget.style.backgroundColor = "#250902";
			this.incorrectSound.play();
			const brokenSwordImage = document.querySelector(
				".grammar-game-broken-sword"
			);
			brokenSwordImage.classList.add("active");
			setTimeout(() => {
				brokenSwordImage.classList.remove("active");
			}, 2500);
			resultElement.innerHTML = `
      <div class="d-flex align-items-center justify-content-center" style="margin: 0px 200px;">
        <i class="fa fa-times-circle" aria-hidden="true"></i>
        <p id="incorrect">
          Incorrect, Please try again!
        </p>
      </div>
        <button type="button" class="button-check-grammar-game ms-auto" id="try-again-button"><i class="fa fa-rotate-right fa-2x text-white" style="font-size:20px;"></i></button>
      `;
			document.getElementById("hint").innerHTML = "";
			const correction = document.getElementById("hint");
			correction.innerHTML = `<p id="displayHint">Correct Spelling: ${this.randomWord}</p>`;
			document
				.getElementById("try-again-button")
				.addEventListener("click", () => {
					this.resultsTarget.style.backgroundColor = "";
					this.inputTarget.value = "";
					resultElement.innerHTML = "";
				});
		}
	}

	textToSpeech() {
		const utterance = new SpeechSynthesisUtterance(this.randomWord);
		window.speechSynthesis.speak(utterance);
	}

	hintWord() {
		const divElement = document.getElementById("hint");
		divElement.innerHTML = `<p id="displayHint">HINT: ${this.jpwords}</p>`;
	}

	progressBar() {
		const progress = (this.currentAttempt / this.wordsArrayValue.length) * 100;
		const progressBarElement = document.querySelector("#current-progress-bar");
		progressBarElement.style.width = progress + "%";
		progressBarElement.classList.add("glow");

		// Remove glow in 500ms
		setTimeout(() => {
			progressBarElement.classList.remove("glow");
		}, 500);
	}

	gameOver() {
		document.getElementById("hint").innerHTML = "";
		const resultElement = this.resultsTarget;
		// resultElement.innerHTML = `
		//   <div class="d-flex align-items-center justify-content-center">
		//     <p id="congrats">
		//       Congratulations on completing the game! You scored ${this.score} points.
		//     </p>
		//     <lord-icon
		//       src="https://cdn.lordicon.com/eiwtsgei.json"
		//       trigger="loop"
		//       state="loop-cycle"
		//       style="width:50px;height:50px">
		//     </lord-icon>
		//   </div>
		//   <div class="firework"></div>
		//   <div class="firework"></div>
		//   <div class="firework"></div>
		// `;
		this.inputTarget.disabled = true;
		const dataToUpdate = {
			score: this.score,
			questions: this.emptyCorrectArray.map((sentence, index) => ({
				student_answer: this.emptyUserArray[index] || "",
				correct_answer: this.emptyCorrectArray[index],
				options: [],
			})),
		};
		// Saving data in DB
		fetch(
			`/student/submissions/${this.submissionIdValue}/games/${this.gameIdValue}`,
			{
				method: "PATCH",
				headers: {
					"Content-Type": "application/json",
					"X-CSRF-Token": document
						.querySelector('meta[name="csrf-token"]')
						.getAttribute("content"),
				},
				body: JSON.stringify(dataToUpdate),
			}
		)
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
		window.location.href = `/student/submissions/${
			this.submissionIdValue
		}/games/${parseInt(this.gameIdValue) + 1}/edit`;
	}
}
