setTimeout(function () {
    const preloader = document.getElementById('preloader');
    if (preloader) {
      preloader.style.opacity = '0'; // Add fade-out effect
      setTimeout(() => {
        preloader.style.display = 'none'; // Remove it completely after fade-out
      }, 500); // Matches the fade-out transition duration
    }
  }, 3000); // Time in milliseconds (3 seconds)