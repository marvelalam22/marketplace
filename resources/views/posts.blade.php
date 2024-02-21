@extends('layouts.main')

@section('container')
    <h1 class="mb-3 text-center">{{ $title }}</h1>

    <div class="row justify-content-center mb-3">
        <div class="col-md-6">

            <form action="/posts">
                @if (request('category'))
                    <input type="hidden" name="category" value="{{ request('category') }}">
                @endif

                @if (request('author'))
                    <input type="hidden" name="author" value="{{ request('author') }}">
                @endif

                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Search.." name="search"
                        value="{{ request('search') }}">
                    <button class="btn btn-danger" type="submit">Search</button>
                </div>
            </form>
        </div>
    </div>

    @if ($posts->count())
        <div class="container">
            <div class="row">
                @foreach ($posts as $post)
                    <div class="col-md-4 mb-3">
                        <div class="card">
                            <div class="position-absolute px-3 py-2" style="background-color: rgba(0,0,0,0.5)">

                                <a href="/posts?category={{ $post->category->slug }}"
                                    class="text-white text-decoration-none">{{ $post->category->name }}</a>
                            </div>
                            @if ($post->image)
                                <img src="{{ asset('storage/' . $post->image) }}" alt="{{ $post->category->name }}"
                                    class="img-fluid" style="max-width: 500px; max-height: 500px;">
                            @else
                                <img src="https://source.unsplash.com/500x500?{{ $post->category->name }}"
                                    class="card-img-top" alt="{{ $post->category->name }}">
                            @endif
                            <div class="card-body">
                                <h5 class="card-title">{{ $post->title }}</h5>

                                <p><small class="text-muted">
                                        by : <a href="/posts?author={{ $posts[0]->author->username }}"
                                            class="text-decoration-none">{{ $posts[0]->author->name }}</a>
                                        {{ $posts[0]->created_at->diffForHumans() }}
                                    </small></p>

                                <p class="card-text">{{ $post->excerpt }}</p>

                                <h5>Rp. {{ number_format($post->price, 0, ',', '.') }}</h5>
                                <a href="/posts/{{ $post->slug }}" class="btn btn-danger">Buy</a>
                                @auth
                                    <a href="" class="btn btn-primary"><i class="bi bi-basket"></i> Add to Cart</a>
                                @else
                                    <a href="/login" class="btn btn-primary"><i class="bi bi-basket"></i> Add to Cart</a>
                                @endauth


                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    @else
        <p class="text-center fs-4">No Post Found.</p>
    @endif

    <div class="d-flex justify-content-end">
        {{-- untuk pagination, bisa pindah2 ke halaman lain --}}
        {{ $posts->links() }}
    </div>

    {{-- @foreach ($posts->skip(1) as $post) --}}
    {{-- <article class="mb-5 border-bottom pb-4"> --}}
    {{-- <h2><a href="/posts/{{ $post['slug'] }}">{{ $post['title'] }}</a></h2> --}}
    {{-- <h2><a href="/posts/{{ $post['id'] }}">{{ $post['title'] }}</a></h2> --}}
    {{-- <h2><a href="/posts/{{ $post->slug }}" class="text-decoration-none">{{ $post->title }}</a></h2> --}}

    {{-- mengirimkan id dgn $post->user->id, tapi menggunakan username krna web route mengirimkan username dgn $post->user->username --}}
    {{-- <h5>by : <a href="/authors/{{ $post->author->username }}"
                    class="text-decoration-none">{{ $post->author->name }}</a> in <a
                    href="/categories/{{ $post->category->slug }}"
                    class="text-decoration-none">{{ $post->category->name }}</a></h5> --}}
    {{-- <p>{{ $post->excerpt }}</p> --}}

    {{-- <a href="/posts/{{ $post->slug }}" class="text-decoration-none">Read more..</a> --}}
    {{-- </article> --}}
    {{-- @endforeach --}}
@endsection
