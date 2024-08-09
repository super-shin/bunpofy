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
      1: 'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203907/1_wvofee.png',
      2: 'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203908/2_q1gpvx.png',
      3:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203906/3_lgjwvp.png',
      4:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203906/4_ottud0.png',
      5:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203905/5_etw3uh.png',
      6:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203904/6_w7eyma.png',
      7:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203905/8_qc6y79.png',
      8:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203905/7_ieb5xo.png',
      9:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203905/9_radpyt.png',
      10:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203905/10_a7eq5l.png',
      11:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203882/11_ds5y3z.png',
      12:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203861/12_ki2xcv.png',
      13:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203848/13_piipat.png',
      14:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203849/17_v3dimr.png',
      15:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203845/18_vs7s32.png',
      16:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203851/19_j6qebm.png',
      17:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203845/20_tejg2m.png',
      18:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203846/21_tmq6s5.png',
      19:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203841/26_jshtna.png',
      20:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203842/25_vgnwlq.png',
      21:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203845/22_a4ijvu.png',
      22:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203846/23_je1r7p.png',
      23:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203843/24_lftluo.png',
      24:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203844/27_v1zizt.png',
      25:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203843/30_tb4sp1.png',
      26:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203843/28_wd4sex.png',
      27:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203842/31_fjix53.png',
      28:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203843/29_hzacbj.png',
      29:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203849/14_isgthv.png',
      30:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203848/15_hn4okv.png',
      31:'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723203847/16_udmklw.png'
      // Add more mappings as needed
    };

    // Select the image element
    const imgElement = document.querySelector('img[data-unit-loader-target="image"]');

    // Set the src attribute based on the textbookId
    if (imageUrls[textbookId]) {
      imgElement.src = imageUrls[textbookId];
    } else {
      // Optionally handle the case where no URL is found for the given textbookId
      imgElement.src = 'https://res.cloudinary.com/ddzvfukq6/image/upload/v1723206796/www.bunpofy.me_po61ps.png'; // Clear the image source or set a default image
    }
  }
}
