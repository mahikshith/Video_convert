PRD — Video Converter Pro
Version: 1.0 MVP
Owner: Solo Founder
Platform: iOS + Android
Framework: Flutter
Timeline: 21 Days
Business Model: Free + One-Time Purchase ($4.99) + Optional Annual ($9.99/year)
Positioning:
"Convert, Compress, and Share Videos Completely On-Device. No Uploads. No Watermarks. No Subscription Traps."
________________________________________
1. Product Strategy
What We Are Building
A mobile utility that helps users:
•	Convert videos between formats
•	Compress videos for sharing
•	Extract audio from videos
•	Create GIFs from videos
•	Optimize videos for specific destinations
Everything happens on-device.
No cloud processing.
No accounts.
No uploads.
No AI gimmicks.
________________________________________
What We Are NOT Building
Do NOT build:
❌ PDF editor
❌ Document converter
❌ Cloud storage
❌ User accounts
❌ Social features
❌ AI chat
❌ Team collaboration
❌ Video editing suite
❌ Watermark system
❌ Web platform
❌ Desktop app
❌ Analytics dashboard for users
❌ OCR
❌ Receipt processing
❌ Subscription-only model
________________________________________
Target User
User #1
Content Creator
Problem:
"My video is too large."
Needs:
•	Instagram
•	TikTok
•	YouTube
•	WhatsApp
________________________________________
User #2
Business User
Problem:
"Client won't accept this file format."
Needs:
•	MOV → MP4
•	MP4 → GIF
•	MP4 → Audio
________________________________________
User #3
Regular User
Problem:
"Video too large to send."
Needs:
•	Compression
________________________________________
Success Metrics
Primary Metric
Weekly Conversions Completed
Target:
1000 conversions/week
________________________________________
Secondary Metrics
Conversion Success Rate
Target:
95%+
________________________________________
App Crash Rate
Target:
<1%
________________________________________
Average Conversion Time
Target:
<30 seconds
________________________________________
Free → Paid Conversion
Target:
3–5%
________________________________________
MVP Scope
Feature 1
Import Video
Sources:
•	Files
•	Gallery
•	Camera Roll
•	Share Sheet
Must support:
•	MP4
•	MOV
•	MKV
•	AVI
•	WEBM
________________________________________
Feature 2
Video Conversion
Supported Outputs
•	MP4
•	MOV
•	MKV
•	WEBM
•	GIF
________________________________________
Feature 3
Compression
Presets
Small
Email Friendly
Medium
WhatsApp Friendly
High
Instagram Friendly
Original Quality
Minimal Compression
________________________________________
Feature 4
Destination Presets
User selects:
WhatsApp
Auto:
720p
Compressed
________________________________________
Instagram Reel
1080x1920
________________________________________
TikTok
1080x1920
________________________________________
YouTube
1080p
________________________________________
Email
25MB max
________________________________________
Feature 5
Audio Extraction
Video → MP3
Video → AAC
Video → WAV
________________________________________
Feature 6
GIF Generator
User selects:
Start
End
FPS
Generate GIF
________________________________________
Feature 7
Batch Conversion
PRO FEATURE
Convert multiple files simultaneously
________________________________________
Feature 8
Share Output
Immediately:
•	WhatsApp
•	Telegram
•	Instagram
•	Files
•	AirDrop
•	Gmail
________________________________________
Monetization
Free Tier
•	5 conversions/day
•	Ads (Android only)
•	No watermark
________________________________________
Paid Tier
$4.99 One Time
Unlock:
•	Unlimited conversions
•	Batch conversion
•	Premium presets
•	Remove ads
________________________________________
Optional Annual
$9.99/year
Not required for launch.
________________________________________
User Flow
Flow 1
Open App
↓
Select Video
↓
Choose Preset
↓
Convert
↓
Preview
↓
Save / Share
________________________________________
Target Time:
<20 seconds
________________________________________
Technical Architecture
Framework
Flutter
Reason:
Single codebase
________________________________________
Conversion Engine
FFmpegKit Flutter New
Required Knowledge:
•	FFmpeg
•	Video codecs
•	Encoding profiles
________________________________________
Local Database
Hive
or
SQLite
Store:
•	Conversion history
•	User preferences
________________________________________
Purchases
RevenueCat
________________________________________
Analytics
Firebase Analytics
Track:
•	Conversion started
•	Conversion completed
•	Conversion failed
•	Purchase completed
________________________________________
Folder Structure
/lib

/core
/services
/models
/repositories
/features

/video_import
/video_conversion
/compression
/audio_extract
/gif_creation
/history
/settings
/paywall

/ui
/widgets
/screens
/themes
________________________________________
Claude UI/UX Instructions
These are direct instructions.
________________________________________
Design Philosophy
DO:
✅ Native feeling
✅ Fast
✅ Utility focused
✅ Zero distractions
✅ Minimal taps
✅ Large buttons
✅ Clear hierarchy
________________________________________
DON'T:
❌ Fancy animations
❌ Glassmorphism
❌ Neumorphism
❌ Social-media style feeds
❌ AI-themed design
❌ Gamification
________________________________________
Visual Style
Reference:
•	Linear
•	Raycast
•	Arc Browser
•	Apple Utilities
________________________________________
Colors
Primary:
#2563EB
Success:
#22C55E
Error:
#EF4444
Background:
#FFFFFF
Dark:
#0F172A
________________________________________
Screen List
Splash
2 seconds max
________________________________________
Home
Large CTA:
"Select Video"
Below:
Recent Conversions
________________________________________
Conversion Setup
File Name
Input Format
Output Format
Preset
Convert Button
________________________________________
Progress Screen
Large Progress Ring
Time Remaining
Cancel Button
________________________________________
Results Screen
Before / After Size
File Size Saved
Share Button
Save Button
________________________________________
Paywall
Simple.
No dark patterns.
One-time purchase emphasized.
________________________________________
Required Skills for Claude
Flutter
State Management
Riverpod
FFmpeg
Native iOS Integrations
Native Android Integrations
RevenueCat
Firebase Analytics
Share Sheet Extensions
Performance Optimization
Background Processing
File System APIs
Video Codec Handling
________________________________________
Engineering Risks
Risk 1
FFmpeg Licensing
Must use LGPL-compatible package.
Research before release.
________________________________________
Risk 2
Large File Memory Usage
Avoid loading entire videos into RAM.
Use streaming.
________________________________________
Risk 3
Background Processing
iOS may terminate long-running tasks.
Must test.
________________________________________
Risk 4
Android Device Fragmentation
Test:
•	Samsung
•	Pixel
•	OnePlus
•	Xiaomi
________________________________________
Launch Checklist
Before Coding
•	Flutter project setup
•	RevenueCat setup – set up later
•	Firebase setup
•	App Store account – set up later
•	Play Store account – set up later
________________________________________
Before Beta
•	Crash reporting
•	Analytics
•	Compression benchmarks
•	Device testing
________________________________________
Before Release
•	Privacy Policy
•	Terms
•	Store Screenshots
•	ASO keywords
•	App Icon
________________________________________
Final Founder Verdict
Build this EXACT product.
Do not expand scope.
Do not add AI.
Do not add PDF.
Do not add cloud sync.
Do not add accounts.
Do not add document conversion.
The only objective of V1 is:
Take a video, convert/compress it in under 30 seconds, and let the user share it immediately.
Everything else is a distraction until the app reaches its first 1,000 paying users.

