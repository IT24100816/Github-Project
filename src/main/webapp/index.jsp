<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EcoWheelz - Bike Rental & Ride Sharing</title>

    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Alpine.js -->
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
</head>
<body class="bg-gray-100">

<!-- Header (Navigation Bar) -->
<header class="bg-white shadow-md fixed top-0 left-0 w-full z-50">
    <div class="max-w-7xl mx-auto px-6 lg:px-12 flex justify-between items-center py-4">
        <!-- Logo -->
        <a href="#" class="flex items-center space-x-2">
            <img src="EcoWheelzLogo.png" alt="EcoWheelz Logo" class="h-12 w-auto">
            <span class="text-2xl font-bold text-green-600">EcoWheelz</span>
        </a>

        <!-- Search Bar -->
        <div class="hidden md:flex items-center bg-gray-100 px-4 py-2 rounded-lg shadow-inner">
            <input type="text" placeholder="Search for bikes, locations..." class="bg-transparent outline-none w-72">
            <button class="ml-2 bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700 transition">
                <i class="fa-solid fa-magnifying-glass"></i> <!-- Search Icon -->
            </button>
        </div>

        <!-- Navigation Links -->
        <nav class="hidden md:flex space-x-6">
            <a href="#" class="text-gray-700 hover:text-green-600 transition">Home</a>
            <a href="#" class="text-gray-700 hover:text-green-600 transition">Bikes</a>
            <a href="#" class="text-gray-700 hover:text-green-600 transition">Services</a>
            <a href="#" class="text-gray-700 hover:text-green-600 transition">About</a>
            <a href="#" class="text-gray-700 hover:text-green-600 transition">Contact</a>
        </nav>

        <!-- Actions -->
        <div class="hidden md:flex items-center space-x-6">
            <a href="#" class="bg-blue-600 text-white px-5 py-2 rounded-lg font-semibold hover:bg-blue-700 transition shadow-lg">
                <i class="fa-solid fa-user"></i> Login
            </a>
            <a href="#" class="bg-green-600 text-white px-5 py-2 rounded-lg font-semibold hover:bg-green-700 transition shadow-lg">
                Book a Ride
            </a>
        </div>

        <!-- Mobile Menu Button -->
        <button id="menu-toggle" class="md:hidden text-gray-700 focus:outline-none">
            <i class="fa-solid fa-bars text-2xl"></i>
        </button>
    </div>

    <!-- Mobile Menu -->
    <div id="mobile-menu" class="hidden md:hidden bg-white border-t shadow-lg absolute w-full left-0">
        <div class="flex items-center px-6 py-3 bg-gray-100">
            <input type="text" placeholder="Search for bikes, locations..." class="w-full bg-transparent outline-none">
            <button class="ml-2 bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700 transition">
                <i class="fa-solid fa-magnifying-glass"></i> <!-- Search Icon -->
            </button>
        </div>
        <a href="#" class="block px-6 py-3 text-gray-700 hover:bg-gray-100">Home</a>
        <a href="#" class="block px-6 py-3 text-gray-700 hover:bg-gray-100">Bikes</a>
        <a href="#" class="block px-6 py-3 text-gray-700 hover:bg-gray-100">Services</a>
        <a href="#" class="block px-6 py-3 text-gray-700 hover:bg-gray-100">About</a>
        <a href="#" class="block px-6 py-3 text-gray-700 hover:bg-gray-100">Contact</a>
    </div>
</header>

<!-- Hero Section with Image Slider -->
<section x-data="{ activeSlide: 0, slides: [
    { image: 'images/image1.jpg', title: 'Eco-Friendly Bike Rentals', text: 'Explore your city the green way!' },
    { image: 'images/image2.jpg', title: 'Fast & Affordable Rides', text: 'Find a ride whenever you need it.' },
    { image: 'images/image3.jpg', title: 'Adventure Awaits', text: 'Ride beyond the limits and explore more.' }
] }" class="relative w-full h-[75vh] overflow-hidden mt-20">

    <!-- Slides -->
    <template x-for="(slide, index) in slides" :key="index">
        <div x-show="activeSlide === index" class="absolute inset-0 w-full h-full bg-cover bg-center transition-opacity duration-1000"
             :style="'background-image: url(' + slide.image + ')'">

            <!-- Overlay (Reduced opacity) -->
            <div class="absolute inset-0 bg-black bg-opacity-30"></div>

            <!-- Text Content (Smaller height) -->
            <div class="relative max-w-7xl mx-auto px-6 lg:px-12 h-3/4 flex flex-col justify-center text-white">
                <h2 class="text-4xl lg:text-5xl font-bold" x-text="slide.title"></h2>
                <p class="mt-3 text-lg lg:text-xl" x-text="slide.text"></p>
                <a href="#" class="mt-5 inline-block bg-green-600 px-6 py-3 rounded-lg text-lg font-semibold hover:bg-green-700 transition">
                    Learn More
                </a>
            </div>
        </div>
    </template>

    <!-- Navigation Dots -->
    <div class="absolute bottom-4 left-1/2 transform -translate-x-1/2 flex space-x-2">
        <template x-for="(slide, index) in slides" :key="index">
            <button @click="activeSlide = index" :class="activeSlide === index ? 'bg-white' : 'bg-gray-500'"
                    class="w-3 h-3 rounded-full transition"></button>
        </template>
    </div>
</section>


<!-- Auto Slide Script -->
<script>
    document.addEventListener('alpine:init', () => {
        Alpine.data('slider', () => ({
            activeSlide: 0,
            startAutoSlide() {
                setInterval(() => {
                    this.activeSlide = (this.activeSlide + 1) % 3;
                }, 5000); // Changes every 5 seconds
            }
        }));
    });
</script>

</body>
</html>




