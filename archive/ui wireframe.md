Video Converter Pro — Detailed UI Wireframes (MVP)
________________________________________
Design System
Grid
8pt spacing system

4
8
16
24
32
48
64
________________________________________
Device Targets
iPhone 16 Pro
390 x 844

Android
412 x 915
Design mobile-first.
No tablet optimization in V1.
________________________________________
Screen 1 — Splash
Duration:
1.5 seconds max
Wireframe:
+--------------------------------+
|                                |
|                                |
|                                |
|          [APP ICON]            |
|                                |
|       Video Converter Pro      |
|                                |
|                                |
|                                |
|                                |
|                                |
+--------------------------------+
Notes:
•	No animation
•	No loading indicators
•	Direct navigation
________________________________________
Screen 2 — First Launch Trust Screen
Purpose:
Differentiate from scam converters.
+--------------------------------+
|                                |
|       🔒 100% On Device        |
|                                |
| Your videos never leave        |
| your phone.                    |
|                                |
| No uploads                     |
| No cloud processing            |
| No accounts                    |
|                                |
| Learn More                     |
|                                |
|                                |
|                                |
|                                |
|       [Continue]              |
+--------------------------------+
________________________________________
Screen 3 — Home
This is the money screen.
Everything revolves around:
SELECT VIDEO
Wireframe:
+--------------------------------+
| Video Converter Pro            |
|                                |
|                                |
|                                |
|      [ Select Video ]          |
|                                |
|                                |
|                                |
| Quick Actions                  |
|                                |
| [Compress] [GIF]              |
|                                |
| [Audio]    [Batch]            |
|                                |
|                                |
| Recent Files                   |
| ----------------------------- |
| MP4 → GIF                      |
| Saved 80MB                     |
|                                |
| MOV → MP4                      |
| Saved 150MB                    |
|                                |
+--------------------------------+
Requirements:
•	One primary CTA only
•	Recent history scrollable
________________________________________
Screen 4 — File Picker Result
After selecting file.
+--------------------------------+
| Back                           |
|                                |
| Video Selected                 |
|                                |
| Thumbnail                      |
|                                |
| Vacation.mov                   |
| 210 MB                         |
| 01:45                          |
|                                |
| Choose Action                  |
|                                |
| [Convert Format]              |
| [Compress Video]              |
| [Create GIF]                  |
| [Extract Audio]               |
|                                |
+--------------------------------+
No auto-start conversion.
User chooses.
________________________________________
Screen 5 — Convert Format
Wireframe:
+--------------------------------+
| Back                           |
|                                |
| Convert Format                 |
|                                |
| Input                          |
| MOV                            |
|                                |
| Output                         |
|                                |
| [MP4 ▼]                        |
|                                |
| Advanced                       |
|                                |
| Resolution                     |
| [Original ▼]                   |
|                                |
| Bitrate                        |
| [Auto ▼]                       |
|                                |
|                                |
|                                |
| [Convert]                      |
+--------------------------------+
Output formats:
MP4
MOV
MKV
WEBM
GIF
Nothing else.
________________________________________
Screen 6 — Compress Video
Most important screen.
+--------------------------------+
| Compress Video                 |
|                                |
| Original                       |
| 210 MB                         |
|                                |
| Preset                         |
|                                |
| ◉ Email                        |
| Estimated 25 MB                |
|                                |
| ○ WhatsApp                     |
| Estimated 45 MB                |
|                                |
| ○ Instagram                    |
| Estimated 75 MB                |
|                                |
| ○ Custom                       |
|                                |
|                                |
| [Compress]                     |
+--------------------------------+
Requirements:
User always sees:
Estimated output size
Huge trust factor.
________________________________________
Screen 7 — Create GIF
+--------------------------------+
| Create GIF                     |
|                                |
| Video Preview                  |
|                                |
| ----------------------------- |
|                                |
| [====O=============]           |
| Start                          |
|                                |
| [=========O========]           |
| End                            |
|                                |
| FPS                            |
|                                |
| 15                             |
|                                |
|                                |
| [Generate GIF]                 |
+--------------------------------+
Default:
15 FPS
Max:
30 FPS
________________________________________
Screen 8 — Extract Audio
+--------------------------------+
| Extract Audio                  |
|                                |
| Output Format                  |
|                                |
| ◉ MP3                          |
| ○ AAC                          |
| ○ WAV                          |
|                                |
| Quality                        |
|                                |
| Standard                       |
|                                |
|                                |
|                                |
| [Extract]                      |
+--------------------------------+
________________________________________
Screen 9 — Conversion Progress
Extremely important.
+--------------------------------+
| Converting...                  |
|                                |
|                                |
|        72%                     |
|      ○○○○○○○                   |
|                                |
| MP4 Conversion                 |
|                                |
| Estimated Time                 |
| 12 seconds                     |
|                                |
| Output Size                    |
| ~45 MB                         |
|                                |
|                                |
|                                |
| [Cancel]                       |
+--------------------------------+
Requirements:
Real progress.
Never fake.
If FFmpeg doesn't expose progress:
build parser.
________________________________________
Screen 10 — Success Screen
Most satisfying screen.
+--------------------------------+
| ✅ Success                     |
|                                |
| Before                         |
| 210 MB                         |
|                                |
| After                          |
| 45 MB                          |
|                                |
| Saved                          |
| 165 MB                         |
|                                |
|                                |
| [Share]                        |
|                                |
| [Save To Files]                |
|                                |
| [Convert Another]              |
+--------------------------------+
Must display:
Saved X MB
Psychological reward.
________________________________________
Screen 11 — Share Bottom Sheet
+--------------------------------+
| Share                          |
|                                |
| WhatsApp                       |
| Telegram                       |
| Instagram                      |
| Gmail                          |
| AirDrop                        |
| Files                          |
|                                |
+--------------------------------+
Native share sheet preferred.
________________________________________
Screen 12 — History
+--------------------------------+
| History                        |
|                                |
| Today                          |
|                                |
| MP4 → GIF                      |
| Saved 50 MB                    |
|                                |
| MOV → MP4                      |
| Saved 120 MB                   |
|                                |
| Yesterday                      |
|                                |
| MP4 → MP3                      |
|                                |
+--------------------------------+
Actions:
Re-share
Delete
Repeat conversion
________________________________________
Screen 13 — Paywall
Critical.
No dark patterns.
+--------------------------------+
| Upgrade To Pro                 |
|                                |
| ✅ Unlimited conversions       |
| ✅ Batch conversion            |
| ✅ Premium presets             |
| ✅ No ads                      |
|                                |
|                                |
| $4.99 One Time                 |
|                                |
| [Unlock Forever]               |
|                                |
| Restore Purchase               |
|                                |
| Continue Free                  |
+--------------------------------+
IMPORTANT:
Make
Unlock Forever
primary.
NOT subscription.
________________________________________
Screen 14 — Settings
+--------------------------------+
| Settings                       |
|                                |
| Theme                          |
| System                         |
|                                |
| Default Output Format          |
| MP4                            |
|                                |
| Quality Preset                 |
| Balanced                       |
|                                |
| Privacy                        |
|                                |
| About                          |
|                                |
| Restore Purchase               |
+--------------------------------+
________________________________________
Bottom Navigation
Avoid.
This app does not need:
Home
History
Settings
Profile
style navigation.
Use:
Home
↓
Action
↓
Result
workflow.
Much faster.
________________________________________
Claude UI Execution Rules
Must Do
✅ Material 3
✅ Native iOS feel
✅ Native Android feel
✅ Dark mode
✅ Responsive
✅ Accessible
✅ 44px touch targets
✅ Smooth transitions
________________________________________
Must Not Do
❌ Glassmorphism
❌ Floating particles
❌ Neumorphism
❌ AI-themed UI
❌ ChatGPT style interface
❌ Dashboard overload
❌ Analytics screens
❌ Empty-state illustrations
❌ Gamification
________________________________________
Final UX Principle
Every screen should answer one question:
Can the user take a video,
convert it,
and share it
within 20 seconds?
If a UI element does not help achieve that goal, remove it.

