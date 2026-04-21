# FlashCards

_iOS Device Application Development_

## Project Description

โปรเจกต์ **FlashCards** เป็นแอปพลิเคชันสำหรับทบทวนความรู้ในรูปแบบ flash cards
พัฒนาด้วย **SwiftUI** สำหรับระบบปฏิบัติการ iOS โดยผู้ใช้สามารถเลือกชุดคำถาม (Deck)
และเรียนรู้ผ่านการ์ดทีละใบ โดยมีระบบ flip การ์ดเพื่อดูคำตอบ และระบบติดตามความจำของผู้ใช้

แอปถูกออกแบบให้ใช้งานง่ายและเหมาะกับการทบทวนความรู้ เช่น
คำศัพท์ภาษา, แบบฝึกหัดคณิตศาสตร์ หรือเนื้อหาทางการศึกษาอื่น ๆ

โปรเจกต์นี้จัดทำขึ้นตามโจทย์รายวิชา  
_CN436 iOS Device Application Development_

---

## Tasks Implemented

โปรเจกต์นี้พัฒนาให้ตรงตามข้อกำหนดของโจทย์ดังนี้

---

### 1. FlashCard Deck System

- แอปมี **FlashCard Deck อย่างน้อย 3 ชุด**
- แต่ละ deck ประกอบด้วย flash cards หลายใบ
- ผู้ใช้สามารถเลือก deck เพื่อเริ่มทบทวนได้

---

### 2. Question → Answer Flip System

- แต่ละการ์ดมี:
  - **Question (คำถาม)**
  - **Answer (คำตอบ)**
- ผู้ใช้สามารถ:
  - กดปุ่ม **Flip Card**
  - หรือ **แตะที่การ์ด**
    เพื่อสลับไปดูคำตอบได้

---

### 3. Smooth Flip Animation (3D Rotation)

- ใช้ `rotation3DEffect` ใน SwiftUI
- แสดงการพลิกการ์ดแบบ 3D
- การหมุนมีความลื่นไหลและสมจริง
- รองรับการ flip ไป-กลับระหว่าง Question และ Answer

---

### 4. Next Card Navigation

- มีปุ่ม **Next Card**
- ใช้สำหรับไปยังการ์ดใบถัดไปใน deck
- มี animation:
  - การ์ดเลื่อนออกด้านข้าง
  - fade out / fade in
  - scale effect เล็กน้อย

---

### 5. Mark as Done System

- ผู้ใช้สามารถกดปุ่ม **Done**
- การ์ดใบนั้นจะถูก mark ว่า “จำได้แล้ว”
- การ์ดที่ Done จะ:
  - ไม่ถูกนำกลับมาแสดงอีก
  - ถูกนำออกจากรอบการทบทวน

---

### 6. Shuffle Cards per Session

- เมื่อเข้า deck:
  - การ์ดจะถูก **สุ่มลำดับ (shuffle)** ทุกครั้ง
- ทำให้การทบทวนแต่ละครั้งไม่ซ้ำกัน
- ใช้ระบบ shuffled indices โดยไม่แก้ไข data ต้นฉบับ

---

### 7. Clear State

- เมื่อผู้ใช้จำการ์ดครบทุกใบ:
  - แอปจะแสดงหน้าจอ **"Clear!"**
- เป็น feedback ว่าผู้ใช้ทบทวนครบแล้ว

---

### 8. Adaptive UI (iPhone / iPad / Mac)

- แอปรองรับหลายอุปกรณ์:
  - iPhone
  - iPad
  - Mac (Mac Catalyst / SwiftUI)
- ใช้ `NavigationSplitView`
  - Sidebar (Deck List)
  - Detail (Study View)

---

### 9. SwiftUI Animation & Interaction

- ใช้ animation เพื่อเพิ่ม UX เช่น:
  - Flip card animation
  - Slide transition ระหว่างการ์ด
  - Fade + scale effect
  - Tap gesture บนการ์ด

- ใช้ SwiftUI Animation อย่างเหมาะสมกับงาน

---

## Technologies Used

- Swift
- SwiftUI
- Xcode
- iOS SDK

---

## Project Structure

FlashCards/
├── Models/
│ ├── FlashCard.swift
│ └── Deck.swift
│
├── Data/
│ └── SampleData.swift
│
├── Views/
│ ├── DeckListView.swift
│ ├── StudyView.swift
│ ├── FlashCardView.swift
│ └── ClearView.swift
│
└── ContentView.swift

---

## Team Members

- พลอยพรรณ เต็งประยูร
  รหัสนักศึกษา: 6510615245

- นัชชานนท์ โปษยาอนุวัตร์
  รหัสนักศึกษา: 6510615146

---

## Demo VDO

Link: https://youtu.be/al1BCqmphRg

---

## GitHub Repository

Link: https://github.com/npybird/as3-flashcards
