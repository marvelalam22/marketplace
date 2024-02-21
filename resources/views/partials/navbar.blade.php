    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: rgb(227, 236, 232);">
        <div class="container">

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">

                        <a class="nav-link {{ $active === 'home' ? 'active' : '' }}" href="/">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link {{ $active === 'posts' ? 'active' : '' }}" href="/posts">Store</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link {{ $active === 'categories' ? 'active' : '' }}"
                            href="/categories">Categories</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link {{ $active === 'contact' ? 'active' : '' }}" href="/contact">Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link {{ $active === 'about' ? 'active' : '' }}" href="/about">About Us</a>
                    </li>
                </ul>

                <ul class="navbar-nav ms-auto">
                    @auth

                    @can('admin')
                    <li class="nav-item">
                        <a href="/dashboard" class="nav-link" {{ $active === 'login' ? 'active' : '' }}><i
                            class="bi bi-layout-text-sidebar-reverse"></i> My Dashboard</a></li>
                    </li>                        
                    @else
                    <li class="nav-item">
                        <a href="" class="nav-link" {{ $active === 'login' ? 'active' : '' }}><i
                                class="bi bi-basket"></i> Cart</a>
                    </li>
                    @endcan

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                aria-expanded="false">
                                Welcome back, {{ auth()->user()->name }}
                            </a>
                            <ul class="dropdown-menu">

                                <li>
                                    <form action="/logout" method="post">
                                        @csrf
                                        <button type="submit" class="dropdown-item"><i class="bi bi-box-arrow-right"></i>
                                            Logout</button>
                                    </form>
                                </li>
                            @else
                                <li class="nav-item">
                                    <a href="/login" class="nav-link" {{ $active === 'login' ? 'active' : '' }}><i
                                            class="bi bi-basket"></i> Cart</a>
                                </li>

                                <li class="nav-item">
                                    <a href="/login" class="nav-link" {{ $active === 'login' ? 'active' : '' }}><i
                                            class="bi bi-box-arrow-in-right"></i> Login</a>
                                </li>
                            @endauth
                        </ul>
            </div>
        </div>
    </nav>
