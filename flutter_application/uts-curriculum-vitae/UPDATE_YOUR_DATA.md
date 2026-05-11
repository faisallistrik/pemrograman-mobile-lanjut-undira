## 🔄 HOW TO UPDATE YOUR CV DATA

Follow these steps to customize the app with your own information.

---

## 📍 LOCATION: `lib/data/sample_cv_data.dart`

### STEP 1: Update Personal Information

```dart
final cvData = CVData(
  personalInfo: PersonalInfo(
    name: 'Muhammad Faisal',                    // ← Change to your name
    email: 'faisal@example.com',                // ← Your email
    phone: '+62 812-3456-7890',                 // ← Your phone
    location: 'Jakarta, Indonesia',             // ← Your location
    position: 'Senior Mobile Developer',        // ← Your job title
    summary:
        'Experienced mobile developer with 5+ years...',  // ← Your summary
    profileImage: 'assets/images/profile.png',  // ← Profile picture (optional)
    linkedin: 'https://www.linkedin.com/in/faisal1128/',  // ← Your LinkedIn
    github: 'https://github.com/faisal',        // ← Your GitHub
  ),
  // ... rest of the data
);
```

### STEP 2: Update Work Experience

Replace the experiences list:

```dart
experiences: [
  Experience(
    company: 'Your Company Name',
    position: 'Your Job Title',
    location: 'City, Country',
    startDate: 'Jan 2022',
    endDate: 'Present',  // or 'Dec 2023'
    description:
        'What you did and accomplished in this role',
    isCurrent: true,  // Set to true if current job
  ),
  Experience(
    company: 'Previous Company',
    position: 'Previous Position',
    location: 'City, Country',
    startDate: 'Jun 2020',
    endDate: 'Dec 2021',
    description: 'Previous job responsibilities',
    isCurrent: false,
  ),
  // Add more experiences as needed
],
```

### STEP 3: Update Education

Replace the educations list:

```dart
educations: [
  Education(
    institution: 'Your University',
    degree: 'Bachelor',  // or 'Master', 'Associate', etc.
    fieldOfStudy: 'Your Major/Field',
    startDate: '2015',
    endDate: '2019',
    description: 'Any additional education info',
    gpa: 3.8,  // Your GPA, or 0.0 if not applicable
  ),
  // Add more education entries if needed
],
```

### STEP 4: Update Skills

Replace the skills list:

```dart
skills: [
  Skill(name: 'Flutter', category: 'Mobile', level: 5),
  Skill(name: 'Dart', category: 'Language', level: 5),
  Skill(name: 'Firebase', category: 'Backend', level: 4),
  Skill(name: 'REST API', category: 'Backend', level: 4),
  Skill(name: 'UI/UX Design', category: 'Design', level: 4),
  Skill(name: 'SQL', category: 'Database', level: 4),
  Skill(name: 'Git', category: 'Tools', level: 5),
  Skill(name: 'Agile', category: 'Methodology', level: 4),
  // Add your skills with categories and levels (1-5)
],
```

**Skill Levels:**
- 1 = Beginner
- 2 = Elementary
- 3 = Intermediate
- 4 = Advanced
- 5 = Expert

### STEP 5: Update Languages (Optional)

```dart
languages: [
  'Indonesian (Native)',
  'English (Fluent)',
  // Add more languages if needed
],
```

### STEP 6: Update Certifications (Optional)

```dart
certifications: [
  'Flutter Developer Certification - Google',
  'Mobile App Development - Udacity',
  // Add your certifications
],
```

---

## 📋 COMPLETE EXAMPLE

Here's a complete example of updating your data:

```dart
final cvData = CVData(
  personalInfo: PersonalInfo(
    name: 'John Doe',
    email: 'john.doe@email.com',
    phone: '+1 (555) 123-4567',
    location: 'San Francisco, USA',
    position: 'Full Stack Developer',
    summary:
        'Passionate full-stack developer with 7 years of experience building '
        'scalable web and mobile applications. Expertise in modern web frameworks '
        'and cloud technologies.',
    profileImage: 'assets/images/profile.png',
    linkedin: 'https://www.linkedin.com/in/johndoe/',
    github: 'https://github.com/johndoe',
  ),
  experiences: [
    Experience(
      company: 'TechCorp',
      position: 'Senior Full Stack Developer',
      location: 'San Francisco, USA',
      startDate: 'Mar 2022',
      endDate: 'Present',
      description:
          'Leading development of cloud-based applications. Mentoring junior developers '
          'and architecting scalable microservices. Led team of 5 engineers.',
      isCurrent: true,
    ),
    Experience(
      company: 'WebDev Inc',
      position: 'Full Stack Developer',
      location: 'Los Angeles, USA',
      startDate: 'Jan 2021',
      endDate: 'Feb 2022',
      description:
          'Developed React-based frontend and Node.js backend for SaaS platform. '
          'Improved performance by 40% through optimization.',
      isCurrent: false,
    ),
  ],
  educations: [
    Education(
      institution: 'Stanford University',
      degree: 'Bachelor of Science',
      fieldOfStudy: 'Computer Science',
      startDate: '2015',
      endDate: '2019',
      description: 'Focus on full-stack web development and cloud computing',
      gpa: 3.9,
    ),
  ],
  skills: [
    Skill(name: 'React', category: 'Frontend', level: 5),
    Skill(name: 'Node.js', category: 'Backend', level: 5),
    Skill(name: 'Flutter', category: 'Mobile', level: 4),
    Skill(name: 'JavaScript', category: 'Language', level: 5),
    Skill(name: 'Python', category: 'Language', level: 4),
    Skill(name: 'AWS', category: 'Cloud', level: 4),
    Skill(name: 'Docker', category: 'DevOps', level: 4),
    Skill(name: 'PostgreSQL', category: 'Database', level: 4),
  ],
  languages: [
    'English (Native)',
    'Spanish (Intermediate)',
    'French (Basic)',
  ],
  certifications: [
    'AWS Solutions Architect - Associate',
    'Google Cloud Professional Data Engineer',
    'Full Stack Web Development - Udemy',
  ],
);
```

---

## 🎨 ADD PROFILE PICTURE

1. Prepare an image (PNG or JPG)
2. Rename it to `profile.png`
3. Place it in: `assets/images/`
4. The app will automatically display it in the profile header

**Recommended:**
- Size: 500x500px or larger
- Format: PNG or JPG
- Content: Professional headshot

---

## 🔗 SOCIAL MEDIA LINKS

### LinkedIn
- Get from: https://www.linkedin.com/in/yourprofile/
- Format: `https://www.linkedin.com/in/yourprofile/`
- Your URL appears in Profile URL section

### GitHub
- Get from: https://github.com/yourusername
- Format: `https://github.com/yourusername`

---

## 💾 SAVE & RUN

After updating:

```bash
# 1. Save the file (automatic in VS Code)

# 2. Run the app
flutter run

# 3. Test all sections in the app
```

---

## ✅ VERIFICATION CHECKLIST

After updating data, verify:
- [ ] All text displays correctly
- [ ] No overflow or truncation
- [ ] Profile information accurate
- [ ] Experience dates make sense
- [ ] Skills are properly categorized
- [ ] Social links are correct
- [ ] Contact info is accurate

---

## 🆘 COMMON ISSUES

### **Syntax Error**
- Check brackets and parentheses
- Ensure strings end with quotes
- Look for missing commas

### **Data Not Showing**
- Make sure field names are correct
- Check for typos in variable names
- Save file and hot reload

### **Links Not Working**
- Verify URLs are complete (include https://)
- Check for typos in email/phone
- Test URLs in browser first

### **Profile Picture Not Showing**
- Verify image exists in `assets/images/`
- Check filename (case-sensitive)
- Ensure file format is PNG or JPG

---

## 🎯 TIPS

1. **Keep format consistent** - Follow the example structure
2. **Use realistic data** - Test with real information
3. **Update regularly** - Keep CV current
4. **Test thoroughly** - Check all screens after changes
5. **Backup your data** - Save original data somewhere

---

## 📞 NEED HELP?

Refer to:
- **QUICK_START.md** - General setup
- **IMPLEMENTATION_GUIDE.md** - Technical details
- **STRUCTURE.md** - Project organization

---

**Happy updating!** 🎉

Your personalized CV app is ready! 🚀
