@extends('layouts.main')

@section('container')

    <div class="container">
        <div class="row justify-content-center mb-5">
            <div class="col-md-8">
                <a href="/posts" class="d-block mt-3"> Back to Store</a>
<br>
                <h1 class="mb-3">{{ $post->title }}</h1>

                @if ($post->image)
                    <div style="max-height: 350px; overflow:hidden;">
                        <img src="{{ asset('storage/' . $post->image) }}" alt="{{ $post->category->name }}" class="img-fluid">
                    </div>
                @else
                    <img src="https://source.unsplash.com/700x400?{{ $post->category->name }}"
                        alt="{{ $post->category->name }}" class="img-fluid">
                @endif

                <br><br>
                <p class="text-center">Silahkan lakukan pembayaran ke rekening 000000, sebesar</p>
                <h5 class="text-center">Rp. {{ number_format($price, 0, ',', '.') }}</h5>
                <p class="text-center">lakukan pembayaran sebelum</p>
                <h6 class="text-center">{{ $batas_waktu_order }}</h6>
            </div>
        </div>
    </div>
@endsection
