import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="notification"
export default class extends Controller {
	connect() {}

	feedbackNotification(event) {
		const notificationId = event.currentTarget.dataset.valueNotificationId;
		const challengeId = event.currentTarget.dataset.valueChallengeId;
		event.currentTarget
			.querySelector(".student-challenges-card-feedback-notification")
			.classList.add("d-none");
		fetch(
			`/student/challenges/${challengeId}/notifications/${notificationId}`,
			{
				method: "PATCH",
				headers: {
					"Content-Type": "application/json",
					"X-CSRF-Token": document
						.querySelector('meta[name="csrf-token"]')
						.getAttribute("content"),
				},
			}
		)
			.then((response) => {
				if (response.ok) {
					return response.text(); // If you're expecting a Turbo Stream response
				} else {
					throw new Error("Failed to update the notification");
				}
			})
			.then((turboStreamResponse) => {
				// Turbo will automatically process the Turbo Stream response and update the DOM
				console.log("Notification updated successfully!");
			})
			.catch((error) => {
				console.error(error);
			});
	}

	challengeNotification(event) {
		const notificationId = event.currentTarget.dataset.valueNotificationId;
		const challengeId = event.currentTarget.dataset.valueChallengeId;
		console.log(notificationId);
		event.currentTarget
			.querySelector(".student-challenges-card-challenge-notification")
			.classList.add("d-none");
		fetch(
			`/student/challenges/${challengeId}/notifications/${notificationId}`,
			{
				method: "PATCH",
				headers: {
					"Content-Type": "application/json",
					"X-CSRF-Token": document
						.querySelector('meta[name="csrf-token"]')
						.getAttribute("content"),
				},
			}
		)
			.then((response) => {
				if (response.ok) {
					return response.text(); // If you're expecting a Turbo Stream response
				} else {
					throw new Error("Failed to update the notification");
				}
			})
			.then((turboStreamResponse) => {
				// Turbo will automatically process the Turbo Stream response and update the DOM
				console.log("Notification updated successfully!");
			})
			.catch((error) => {
				console.error(error);
			});
	}
}
