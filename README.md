1. - Cubit adalah pendekatan yang lebih sederhana. Kamu langsung membuat method untuk mengubah state. Misalnya cubit.increment() akan langsung menghasilkan state baru. Cubit lebih ringkas dan mudah dipahami, cocok untuk aplikasi sederhana.
   - Bloc menggunakan pendekatan event → state. Artinya, kamu membuat event terlebih dahulu, lalu Bloc akan memproses event tersebut dan menghasilkan state baru. Contohnya: bloc.add(IncrementEvent()) → Bloc memproses → state baru diemit. Bloc lebih verbose, tetapi lebih terstruktur dan cocok untuk aplikasi kompleks yang banyak logika dan event.

2. Memisahkan ketiga komponen
   - Maintainability (Mudah dipelihara) – Perubahan UI tidak akan merusak logika bisnis, dan sebaliknya.
   - Testability (Mudah diuji) – Logika bisnis bisa diuji secara terpisah tanpa tergantung UI.
   - Scalability (Mudah dikembangkan) – Tim bisa bekerja paralel, misalnya designer fokus di UI, developer fokus di logika bisnis.
   - Reusability (Dapat digunakan kembali) – Model dan logika bisnis bisa dipakai di UI lain atau proyek lain tanpa modifikasi besar.
     
3. 1. CartInitial
      - Status awal ketika keranjang masih kosong atau belum dimuat.
      - Fungsi: Menjadi state default sebelum ada interaksi user.
    2. CartLoading
       - Status saat data keranjang sedang diproses, misalnya menambah atau menghapus item.
       - Fungsi: Memberikan feedback ke UI, misalnya menampilkan loading spinner.
    3. CartLoaded
       - Status ketika data keranjang berhasil dimuat atau diperbarui.
       - Fungsi: Menyediakan data keranjang terbaru untuk ditampilkan di UI, termasuk jumlah item dan total harga.
