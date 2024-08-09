import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="dashboard"
export default class extends Controller {
	static targets = ["studentListElement"];
	connect() {}

	list(event) {
		console.log(JSON.parse(event.currentTarget.dataset.firstName));
		const firstNames = JSON.parse(event.currentTarget.dataset.firstName);
		const lastNames = JSON.parse(event.currentTarget.dataset.lastName);
		const classroomName = event.currentTarget.querySelector("p").innerText;
		console.log(classroomName);
		this.studentListElementTarget.innerHTML = "";
		this.studentListElementTarget.innerHTML = `<div class="py-2 fw-bold border-bottom dashboard-student-list-top">
          <p class="text-center">${classroomName}</p>
          </div>`;
		firstNames.forEach((firstName, index) => {
			const lastName = lastNames[index];
			this.studentListElementTarget.innerHTML += `
        <div class="p-2 border-bottom">
          <p>${firstName} ${lastName}</p>
        </div>
      `;
		});
	}
}
