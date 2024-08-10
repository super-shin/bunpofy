import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="unit-loader"
export default class extends Controller {
  static targets = ['textbookSelect', 'unitSelect'];

  connect() {
    this.unitsByTextbook = JSON.parse(this.element.dataset.unitsByTextbook)
  }

  updateUnits() {
    const textbookId = this.textbookSelectTarget.value

    this.unitSelectTarget.innerHTML = '<option value ="">Select a unit</option>'

    if (textbookId && this.unitsByTextbook[textbookId]) {
      this.unitsByTextbook[textbookId].forEach(unit => {
        const option = document.createElement('option')
        option.value = unit.id
        option.textContent = unit.name
        this.unitSelectTarget.appendChild(option)
      })
    }

    // Define a mapping of textbookId to image URLs
    const imageUrls = {
      1: 'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723252490/19_v74swk.png',
      2: 'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723252491/18_mpqsvl.png',
      3:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723252491/17_h8a5ja.png',
      4:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723252506/16_ml8xpy.png',
      5:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723252506/15_mxkpop.png',
      6:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723252506/14_uboyzd.png',
      7:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723252507/12_omkjxl.png',
      8:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723252507/13_cooclj.png',
      9:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723252507/11_ekromu.png',
      10:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203905/10_a7eq5l.png',
      11:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203882/11_ds5y3z.png',
      12:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723252513/8_xlkxxk.png',
      13:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723252513/7_i12474.png',
      14:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723252514/3_z9ofxc.png',
      15:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723252518/2_cdldnz.png',
      16:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723252519/1_kqgugr.png',
      17:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723252488/30_mlazjs.png',
      18:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723252489/29_wmhzmi.png',
      19:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723252490/25_sub7lm.png',
      20:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203842/25_vgnwlq.png',
      21:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723252489/28_cfxkyt.png',
      22:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723252489/26_kdt0mg.png',
      23:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723252489/27_mzkn4f.png',
      24:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723252490/23_qqujgc.png',
      25:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723252490/21_oh1od5.png',
      26:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723252490/22_wlzak2.png',
      27:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723252491/20_nxvegp.png',
      28:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723252520/Untitled_design_xygzy8.png',
      29:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723252513/6_zxn5fz.png',
      30:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723252513/5_poft3h.png',
      31:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723252513/4_waq1hl.png'
      // Add more mappings as needed
    };

    // Select the image element
    const imgElement = document.querySelector('img[data-unit-loader-target="image"]');

    // Set the src attribute based on the textbookId
    if (imageUrls[textbookId]) {
      imgElement.src = imageUrls[textbookId];
    } else {
      // Optionally handle the case where no URL is found for the given textbookId
      imgElement.src = 'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723251348/Untitled_design_oswzkh.gif'; // Clear the image source or set a default image
    }
  }
}
