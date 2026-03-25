import {Controller} from "@hotwired/stimulus"

export default class extends Controller{
    static values = { lat: Number, lng: Number}


    connect() {
        this.map = L.map(this.element).setView([this.latValue, this.lngValue], 13)

        L.titleLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', 
            {attribution: '(C) OpenStreetMap Contributors'}
        ).addTo(this.map);

        setTimeout(() => {
            this.map.invalidateSize();
        }, 100);
    }

    disconnect() {
        if (this.map) {
            this.map.remove();
        }
    }
}