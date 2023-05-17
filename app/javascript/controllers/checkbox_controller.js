import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    static targets = ["box"];

    handleClick({ target }) {
        target.parentElement.classList.toggle('checked');

    }

    connect() {
        this.boxTargets.forEach((box) => (box.getAttribute("checked") ? box.parentElement.classList.add("checked") : ""))
    }
}
