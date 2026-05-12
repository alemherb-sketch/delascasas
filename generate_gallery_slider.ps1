$fotos = Get-ChildItem -Path "c:\Users\ALEM\Desktop\DELASCASAS\assets\Galeria\fotos" -File | Sort-Object Name
$videos = Get-ChildItem -Path "c:\Users\ALEM\Desktop\DELASCASAS\assets\Galeria\videos" -File | Sort-Object Name

$html = @"
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Galería de Trabajos - DELASCASAS</title>
    <meta name="description" content="Galería de fotos y videos de nuestros proyectos realizados en casas prefabricadas a nivel nacional.">
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800&display=swap" rel="stylesheet">
    
    <!-- Phosphor Icons -->
    <script src="https://unpkg.com/@phosphor-icons/web"></script>
    
    <!-- Swiper CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    
    <!-- Fancybox CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/ui@5.0/dist/fancybox/fancybox.css" />

    <!-- CSS -->
    <link rel="stylesheet" href="../css/style.css?v=1.3">
</head>
<body>

    <!-- Header / Nav -->
    <header class="header scrolled" style="background: rgba(15, 23, 42, 0.95);">
        <div class="container nav-container">
            <a href="../index.html" class="logo">
                <img src="../assets/logo.png" alt="DE LAS CASAS PERU Logo" class="logo-img">
            </a>
            <button class="mobile-toggle" id="mobile-toggle">
                <i class="ph ph-list"></i>
            </button>
            <nav class="nav-menu" id="nav-menu">
                <a href="../index.html#inicio" class="nav-link">Inicio</a>
                <a href="../index.html#nosotros" class="nav-link">Nosotros</a>
                <a href="../index.html#productos" class="nav-link">Productos</a>
                <a href="../index.html#servicios" class="nav-link">Servicios</a>
                <a href="../index.html#contacto" class="nav-link btn-nav-cta">Cotizar Ahora</a>
            </nav>
        </div>
    </header>

    <!-- Gallery Section -->
    <section class="section gallery-page bg-dark" style="padding-top: 120px;">
        <div class="container">
            <div class="section-title text-center fade-up visible">
                <span class="subtitle">Portafolio</span>
                <h2>Galer&iacute;a de Trabajos</h2>
                <p>Explora todos los proyectos que hemos realizado a nivel nacional. Haz clic en una imagen o video para expandirlo.</p>
            </div>

            <!-- VIDEOS SECTION -->
            <div class="gallery-category fade-up visible">
                <h3 style="color: var(--primary-color); border-bottom: 2px solid rgba(0,240,255,0.2); padding-bottom: 10px; margin-bottom: 2rem; display: flex; align-items: center; gap: 0.5rem;">
                    <i class="ph-fill ph-video-camera"></i> Videos
                </h3>
                
                <div class="swiper gallery-swiper" style="padding-bottom: 50px;">
                    <div class="swiper-wrapper">
"@

foreach ($video in $videos) {
    $videoName = $video.Name
    $html += @"
                        <div class="swiper-slide">
                            <div class="gallery-item" style="cursor: pointer;">
                                <a data-fancybox="videos" href="../assets/Galeria/videos/$videoName" style="display: block; width: 100%; height: 100%;">
                                    <video class="gallery-media" style="background: black; object-fit: cover; pointer-events: none;">
                                        <source src="../assets/Galeria/videos/$videoName" type="video/mp4">
                                    </video>
                                    <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); color: white; background: rgba(0,0,0,0.5); border-radius: 50%; width: 50px; height: 50px; display: flex; align-items: center; justify-content: center; font-size: 24px;">
                                        <i class="ph-fill ph-play"></i>
                                    </div>
                                </a>
                            </div>
                        </div>
"@
}

$html += @"
                    </div>
                    <!-- Swiper Pagination -->
                    <div class="swiper-pagination"></div>
                    <!-- Swiper Navigation -->
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                </div>
            </div>

            <!-- FOTOS SECTION -->
            <div class="gallery-category fade-up visible delay-1" style="margin-top: 3rem;">
                <h3 style="color: var(--primary-color); border-bottom: 2px solid rgba(0,240,255,0.2); padding-bottom: 10px; margin-bottom: 2rem; display: flex; align-items: center; gap: 0.5rem;">
                    <i class="ph-fill ph-camera"></i> Fotos
                </h3>
                
                <div class="swiper gallery-swiper" style="padding-bottom: 50px;">
                    <div class="swiper-wrapper">
"@

foreach ($foto in $fotos) {
    $fotoName = $foto.Name
    $html += @"
                        <div class="swiper-slide">
                            <div class="gallery-item" style="cursor: pointer;">
                                <a data-fancybox="fotos" href="../assets/Galeria/fotos/$fotoName" style="display: block; width: 100%; height: 100%;">
                                    <img src="../assets/Galeria/fotos/$fotoName" alt="Foto del proyecto" class="gallery-media" loading="lazy">
                                    <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); color: white; background: rgba(0,0,0,0.5); border-radius: 50%; width: 50px; height: 50px; display: flex; align-items: center; justify-content: center; font-size: 24px; opacity: 0; transition: opacity 0.3s;" class="zoom-icon">
                                        <i class="ph-bold ph-magnifying-glass-plus"></i>
                                    </div>
                                </a>
                            </div>
                        </div>
"@
}

$html += @"
                    </div>
                    <!-- Swiper Pagination -->
                    <div class="swiper-pagination"></div>
                    <!-- Swiper Navigation -->
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                </div>
            </div>
            
            <div class="text-center" style="margin-top: 4rem;">
                <a href="../index.html" class="btn btn-outline">
                    <i class="ph-bold ph-arrow-left"></i> Volver al Inicio
                </a>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container footer-content">
            <div class="footer-brand">
                <a href="../index.html" class="logo">
                    <img src="../assets/logo.png" alt="DE LAS CASAS PERU Logo" class="logo-img">
                </a>
                <p>Especialistas en casas prefabricadas y estructuras modulares a nivel nacional.</p>
            </div>
            <div class="footer-links">
                <h4>Enlaces Rápidos</h4>
                <ul>
                    <li><a href="../index.html#inicio">Inicio</a></li>
                    <li><a href="../index.html#nosotros">Nosotros</a></li>
                    <li><a href="../index.html#productos">Productos</a></li>
                </ul>
            </div>
            <div class="footer-contact">
                <h4>Contacto</h4>
                <ul>
                    <li><i class="ph-fill ph-phone"></i> +51 991 841 570</li>
                    <li><i class="ph-fill ph-map-pin"></i> Atención en todo el Perú</li>
                </ul>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; <span id="year"></span> DELASCASAS. Todos los derechos reservados.</p>
        </div>
    </footer>

    <!-- Floating WhatsApp Button -->
    <a href="https://wa.me/51991841570" target="_blank" class="floating-whatsapp" aria-label="Chat on WhatsApp">
        <i class="ph-fill ph-whatsapp-logo"></i>
    </a>

    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    
    <!-- Fancybox JS -->
    <script src="https://cdn.jsdelivr.net/npm/@fancyapps/ui@5.0/dist/fancybox/fancybox.umd.js"></script>

    <!-- JavaScript -->
    <script src="../js/main.js?v=1.3"></script>
</body>
</html>
"@

Set-Content -Path "c:\Users\ALEM\Desktop\DELASCASAS\GALERIA\index.html" -Value $html -Encoding UTF8
