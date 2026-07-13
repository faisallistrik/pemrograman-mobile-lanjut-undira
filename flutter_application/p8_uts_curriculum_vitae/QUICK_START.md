## 🚀 QUICK START GUIDE

Ikuti langkah-langkah ini untuk menjalankan CV app:

### 1️⃣ Install Dependencies
```bash
flutter pub get
```

### 2️⃣ Update CV Data
Edit file: `lib/data/sample_cv_data.dart`

Update dengan data Anda:
- Name, email, phone, location
- Position dan professional summary
- Work experiences (company, position, dates, description)
- Education (institution, degree, field, GPA)
- Skills (name, category, level 1-5)
- Languages dan certifications

### 3️⃣ (Optional) Tambah Profile Image
- Letakkan foto di `assets/images/profile.png`
- Update `profileImage` di `sample_cv_data.dart`

### 4️⃣ Run App
```bash
flutter run
```

### 5️⃣ Test di Device
- Cek semua 5 screens (Profile, Experience, Education, Skills, Contact)
- Test semua buttons dan links
- Verify responsive design

---

## 📱 App Structure

**5 Main Screens:**
1. **Profile** - Overview & contact buttons
2. **Experience** - Work history
3. **Education** - Education & certifications
4. **Skills** - Skills dengan rating
5. **Contact** - Contact info & social links

---

## 🔧 Customization Cepat

### Ubah Primary Color
File: `lib/main.dart`
```dart
primarySwatch: Colors.blue,  // ganti dengan warna lain
```

### Ubah App Name
File: `lib/data/sample_cv_data.dart` - update `name` field

### Tambah Social Media
File: `lib/data/sample_cv_data.dart`
```dart
PersonalInfo(
  // ...
  linkedin: 'https://linkedin.com/in/yourname',
  github: 'https://github.com/yourname',
)
```

---

## 📦 Plugins Sudah Ada

- ✅ url_launcher - Untuk links & email
- ✅ share_plus - Share CV
- ✅ font_awesome_flutter - Icons
- ✅ smooth_page_indicator - Animations
- ✅ google_fonts - Fonts

---

## 📝 Data Model Examples

```dart
// Single Experience
Experience(
  company: 'PT Tech Indonesia',
  position: 'Mobile Developer',
  location: 'Jakarta',
  startDate: 'Jan 2022',
  endDate: 'Present',
  description: 'Developed Flutter apps',
  isCurrent: true,
)

// Skill
Skill(
  name: 'Flutter',
  category: 'Mobile',
  level: 5,  // 1=Beginner, 5=Expert
)
```

---

## ✅ Checklist Sebelum Submit

- [ ] CV data sudah diupdate lengkap
- [ ] Semua links (LinkedIn, GitHub, email) berfungsi
- [ ] Layout responsive di berbagai ukuran
- [ ] Tidak ada error di console
- [ ] Semua 5 screens berfungsi normal
- [ ] Share CV button bekerja
- [ ] Contact buttons dapat dipencet

---

## 🎓 Key Features Implemented

✅ Multi-screen navigation dengan BottomNavigationBar
✅ Reusable custom widgets (Cards, Badges, Headers)
✅ URL launcher untuk email, phone, social media
✅ Share functionality
✅ Professional UI dengan Material 3
✅ Organized data structure dengan models
✅ Category-based skill grouping
✅ Experience status indicator ("Current")
✅ GPA display di education
✅ Language support section

---

## 🆘 Help

Jika ada error:
1. Run `flutter clean` lalu `flutter pub get`
2. Pastikan Flutter & Dart updated
3. Check console untuk error messages
4. Verify semua file ada di `lib/`

---

Good luck! 🎉
