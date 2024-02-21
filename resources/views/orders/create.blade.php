@extends('layouts.main')

@section('container')
    <div class="row justify-content-center">
        <div class="col-lg-5">

            <main class="form-registration w-100 m-auto">
                <h1 class="h3 mb-3 fw-normal text-center">Payment Form</h1>
                <br>
                <h1 class="mb-3 text-center">{{ $post->title }}</h1>
                @if ($post->image)
                    <div style="max-height: 350px; overflow:hidden;">
                        <img src="{{ asset('storage/' . $post->image) }}" alt="{{ $post->category->name }}"
                            class="img-fluid">
                    </div>
                @else
                    <img src="https://source.unsplash.com/700x400?{{ $post->category->name }}"
                        alt="{{ $post->category->name }}" class="img-fluid">
                @endif
                <br><br>

                <form action="/orders" method="post">
                    @csrf

                    <input type="hidden" name="post_id" id="post_id" value="{{ $post->id }}">
                    <input type="hidden" name="price" id="price" value="{{ $post->price }}">

                    <div class="form-floating">
                        <input type="text" name="name"
                            class="form-control rounded-top @error('name') is-invalid @enderror" id="name"
                            placeholder="Name" required value="{{ old('name') }}">
                        <label for="name">Name</label>
                        @error('name')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="form-floating">
                        <input type="text" name="alamat" class="form-control @error('alamat') is-invalid @enderror"
                            id="alamat" placeholder="alamat" required value="{{ old('alamat') }}">
                        <label for="alamat">Alamat</label>
                        @error('alamat')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="form-floating">
                        <input type="email" name="email" class="form-control @error('email') is-invalid @enderror"
                            id="email" placeholder="name@example.com" required value="{{ old('email') }}">
                        <label for="email">Email address</label>
                        @error('email')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="form-floating">
                        <input type="text" name="telepon" class="form-control @error('telepon') is-invalid @enderror"
                            id="telepon" placeholder="telepon" required value="{{ old('telepon') }}">
                        <label for="telepon">Telepon</label>
                        @error('telepon')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="form-floating">
                        <input type="text" name="rekening" class="form-control @error('rekening') is-invalid @enderror"
                            id="rekening" placeholder="rekening" required value="{{ old('rekening') }}">
                        <label for="rekening">Nama Bank</label>
                        @error('rekening')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="form-floating">
                        <input type="integer" name="no_rekening" class="form-control @error('no_rekening') is-invalid @enderror"
                            id="no_rekening" placeholder="no_rekening" required value="{{ old('no_rekening') }}">
                        <label for="no_rekening">No Rekening</label>
                        @error('no_rekening')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    <button class="btn btn-primary w-100 py-2 mt-3" type="submit">Pay Now</button>
                </form>
            </main>

        </div>
    </div>
@endsection
