# CV Application - Complete Implementation Guide

## 📋 Project Overview

Aplikasi CV profesional yang dibangun dengan Flutter dengan fitur lengkap untuk menampilkan profile, pengalaman kerja, pendidikan, skills, dan kontak.

## 🎯 Fitur Utama

✅ **Multi-Screen Navigation** - 5 halaman utama dengan bottom navigation
✅ **Profile Overview** - Display lengkap dengan social media links
✅ **Experience Section** - Riwayat pekerjaan dengan status "Current"
✅ **Education Timeline** - Pendidikan dengan GPA dan deskripsi
✅ **Skills Directory** - Skills terorganisir per kategori dengan rating
✅ **Contact Hub** - Multiple contact options dan social media integration
✅ **Share CV** - Fitur untuk share CV melalui berbagai platform
✅ **URL Launcher** - Link clickable ke email, phone, LinkedIn, GitHub
✅ **Responsive Design** - Optimal layout di semua ukuran device

## 📁 Project Structure

```
lib/
├── main.dart                    # App entry point dengan navigasi
├── data/
│   └── sample_cv_data.dart     # Sample data CV (UPDATE DENGAN DATA ANDA)
├── models/
│   ├── person.dart             # Model untuk personal info
│   └── cv_model.dart           # Complete CV data models
├── screens/
│   ├── profile_screen.dart      # Profile & Overview
│   ├── experience_screen.dart   # Work experience
│   ├── education_screen.dart    # Education & certifications
│   ├── skills_screen.dart       # Skills dengan rating
│   ├── contact_screen.dart      # Contact & social links
│   └── home_screen.dart         # (Legacy template)
├── widgets/
│   ├── custom_widgets.dart      # Reusable components
│   └── (existing files)
└── utils/
    ├── theme.dart               # Theme configuration
    └── constants.dart           # App constants
```

## 🔌 Plugins Ditambahkan

```yaml
url_launcher: ^6.2.0           # Untuk membuka links dan email
share_plus: ^7.2.0             # Untuk share functionality
font_awesome_flutter: ^10.7.0  # Icon pack yang lebih lengkap
smooth_page_indicator: ^1.1.0  # Page indicator untuk animations
google_fonts: ^6.2.0           # Custom fonts dari Google
```

## 🎨 Custom Widgets

### 1. **ProfileHeader**
Menampilkan profile picture, name, position, location, dan summary

### 2. **ExperienceCard**
Card untuk menampilkan experience dengan status "Current" badge

### 3. **EducationCard**
Card untuk education dengan GPA display

### 4. **SkillBadge**
Badge untuk skills dengan star rating (1-5)

### 5. **SectionHeader**
Header untuk setiap section dengan icon

### 6. **ContactButton & SocialButton**
Button untuk contact dan social media

## 🚀 Setup & Installation

### 1. Get Dependencies
```bash
cd uts-curriculum-vitae
flutter pub get
```

### 2. Update CV Data
Edit file `lib/data/sample_cv_data.dart` dengan data Anda:

```dart
final cvData = CVData(
  personalInfo: PersonalInfo(
    name: 'Your Name',
    email: 'your.email@example.com',
    phone: '+62 812-3456-7890',
    location: 'Your Location',
    position: 'Your Position',
    summary: 'Your professional summary...',
    linkedin: 'https://linkedin.com/in/yourprofile',
    github: 'https://github.com/yourprofile',
  ),
  // ... add your experiences, educations, skills
);
```

### 3. Run App
```bash
flutter run
```

## 📱 Screens Overview

### 1. **Profile Screen** (Home)
- Profile header dengan gradient background
- Quick info box (email, phone, location)
- Languages section
- Social media buttons (LinkedIn, GitHub, Email, Phone)
- Share CV functionality

### 2. **Experience Screen**
- List semua work experiences
- Company name, position, location, date range
- Description untuk setiap job
- "Current" badge untuk ongoing position

### 3. **Education Screen**
- Education entries dengan institution, degree, field
- GPA display jika ada
- Certifications section dengan icon verification

### 4. **Skills Screen**
- Skills diorganisir per category
- Star rating untuk setiap skill (1-5 stars)
- Skill level legend
- Color-coded categories

### 5. **Contact Screen**
- Email, phone, location cards yang clickable
- Social media buttons (LinkedIn, GitHub)
- Quick message section dengan CTA button
- Professional messaging template

## 🎯 Navigation

App menggunakan **BottomNavigationBar** dengan 5 tab:
- Profile (0)
- Experience (1)
- Education (2)
- Skills (3)
- Contact (4)

State management dilakukan dengan `StatefulWidget` untuk tab switching.

## 💡 Tips & Customization

### Mengubah Warna Theme
Edit `lib/utils/theme.dart`:
```dart
static ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,  // Change to Colors.green, Colors.purple, etc
);
```

### Menambah Skill Category
Di `lib/data/sample_cv_data.dart`:
```dart
skills: [
  Skill(name: 'Skill Name', category: 'New Category', level: 5),
]
```

### Mengubah Layout
Setiap screen bisa dikustomisasi di folder `lib/screens/`

### Menambah Social Media Links
Update `PersonalInfo` dengan field baru dan update `ProfileScreen`

## 🔗 URL Schemes yang Didukung

- **Email**: `mailto:email@example.com?subject=Hello`
- **Phone**: `tel:+1234567890`
- **WhatsApp**: `https://wa.me/1234567890`
- **LinkedIn**: `https://linkedin.com/in/username`
- **GitHub**: `https://github.com/username`

## 📝 Data Structure Examples

### PersonalInfo
```dart
PersonalInfo(
  name: 'Name',
  email: 'email@example.com',
  phone: '+62 8xx-xxxx-xxxx',
  location: 'City, Country',
  position: 'Job Title',
  summary: 'Professional summary',
  profileImage: 'assets/images/profile.png',
  linkedin: 'https://linkedin.com/in/username',
  github: 'https://github.com/username',
)
```

### Experience
```dart
Experience(
  company: 'Company Name',
  position: 'Job Title',
  location: 'Location',
  startDate: 'Jan 2022',
  endDate: 'Present',
  description: 'Job description',
  isCurrent: true,
)
```

### Education
```dart
Education(
  institution: 'University Name',
  degree: 'Bachelor',
  fieldOfStudy: 'Computer Science',
  startDate: '2015',
  endDate: '2019',
  description: 'Additional info',
  gpa: 3.8,
)
```

### Skill
```dart
Skill(
  name: 'Flutter',
  category: 'Mobile Development',
  level: 5,  // 1-5 stars
)
```

## 🧪 Testing

### Run Widget Tests
```bash
flutter test
```

### Build for Different Platforms
```bash
# Android
flutter build apk

# iOS
flutter build ipa

# Web
flutter build web

# Windows
flutter build windows

# macOS
flutter build macos

# Linux
flutter build linux
```

## 🐛 Common Issues & Solutions

### 1. **Plugins tidak terinstall**
```bash
flutter pub get
flutter clean
flutter pub get
```

### 2. **URL Launcher tidak bekerja**
Pastikan URL valid dan app memiliki permission

### 3. **Image tidak tampil**
- Pastikan file ada di `assets/images/`
- Update `pubspec.yaml` dengan path yang benar

## 📚 Resources

- [Flutter Docs](https://flutter.dev/docs)
- [url_launcher Package](https://pub.dev/packages/url_launcher)
- [share_plus Package](https://pub.dev/packages/share_plus)
- [Material Design](https://material.io/design)

## ✨ Future Enhancements

- [ ] Dark mode support
- [ ] PDF export CV
- [ ] Multiple language support
- [ ] Animation transitions
- [ ] More social media integrations
- [ ] Profile customization UI
- [ ] Offline functionality
- [ ] Theme customization

---

**Last Updated**: May 2026
**Status**: Production Ready ✅
