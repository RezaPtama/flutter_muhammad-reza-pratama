# (5) Basic Version and Branch Management (Git)

Vesioning adalah mengatur versi dari source code program
Tools
- version Control System (VCS)
- Source Code Manager (SCM)
- Revision Control System (RCS)
 

GIT merupakan salah satu Version Control System populer yang digunakan para developer untuk mengembangkan software secara bersama-sama

Stagging Area

Working directory -> staging area -> repository

Pada working directory atau masih di local untuk memasukan ke staging area dengan command

``` sh
git add ReadMe.md
```

setelah file ReadMe.md masuk kedalam staging area maka untuk memasukan dan memberi komentar ke dalam repository dengan command

``` sh
git commit -m "Memasukan File ReadMe.md"
```
command ini diguankan untuk menyimpan apabila terjadi perubahan dan dilakukan pada repository jarak jauh, namun tidak bisa melakukan perubahan.

setelah itu dilanjutkan dengan command

``` sh
git push origin main
```

perintah yang diguankan untuk mentransfer perubahan file ke repository jarak jauh setelah melakukan perubahan.

origin disini adalah server git yang digunakan 
main disini adalah branch yang digunakan