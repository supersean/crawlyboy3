import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    static targets = ["box"];

    handleClick() {}

    connect() {
        console.log('checkbox connected');
        console.log(this.boxTargets, this.boxTarget, this.hasBoxTarget);
    }
}
