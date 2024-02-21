@extends('layouts.main')

@section('container')
    <div class="container">
        <div class="row justify-content-center mb-5">
            <div class="col-md-8">
                <h1 class="mb-3">{{ $post->title }}</h1>

                <a href="/posts" class="d-block mt-3"> Back to Store</a>

                @if ($post->image)
                    <div style="max-height: 350px; overflow:hidden;">
                        <img src="{{ asset('storage/' . $post->image) }}" alt="{{ $post->category->name }}" class="img-fluid">
                    </div>
                @else
                    <img src="https://source.unsplash.com/700x400?{{ $post->category->name }}"
                        alt="{{ $post->category->name }}" class="img-fluid">
                @endif

                <article class="my-3 fs-5">
                    {!! $post->body !!}
                </article>

                <h5>Rp. {{ number_format($post->price, 0, ',', '.') }}</h5>

                <a href="/orders/{{ $post->slug }}" class="btn btn-danger">Buy Now!</a>
                @auth
                    <a href="" class="btn btn-primary"><i class="bi bi-basket"></i> Add to Cart</a>
                @else
                    <a href="/login" class="btn btn-primary"><i class="bi bi-basket"></i> Add to Cart</a>
                @endauth
            </div>
        </div>
    </div>
@endsection
