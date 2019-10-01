const initUpdateNavbarOnScroll = () => {
  window.addEventListener('scroll', () => {
    const navbar = document.querySelector('.navbar-lewagon');
    if(navbar) {
      if (window.scrollY >= window.innerHeight * 0.5) {
        navbar.classList.add('navbar-lewagon-teal');
      } else {
        navbar.classList.remove('navbar-lewagon-teal');
      }
    }
  });
}

export { initUpdateNavbarOnScroll };