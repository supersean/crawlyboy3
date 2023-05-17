import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["name", "output"]
  greet() {
    this.outputTarget.textContent = `Hello sean and ${this.nameTarget.value}!`
  }
  connect() {
    console.log('hello controller');
  }
}
