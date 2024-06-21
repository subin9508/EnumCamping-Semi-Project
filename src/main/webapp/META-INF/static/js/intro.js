const slides = document.querySelector('.slides');
const slideImages = document.querySelectorAll('.slide img');
let index = 0;

function nextSlide() {
    index++;
    if (index === slideImages.length) {
        index = 0;
    }
    slides.style.transform = `translateX(${-index * 100}%)`;
}

slideImages.forEach(image => {
    image.addEventListener('click', nextSlide);
});