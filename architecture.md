# VoiceVault - Architecture Plan

## 1. Overview
An offline-first note-taking mobile app with speech-to-text transcription and AI-powered text structuring. Users record voice notes, get them transcribed, and organize them in folders with tags.

## 2. Technical Stack
- **Framework:** Flutter
- **Navigation:** go_router
- **State Management:** provider
- **Storage:** Local storage (shared_preferences)
- **Design:** Minimalist, high-contrast, utility-first UI

## 3. UI Structure

### A. Navigation Architecture
Bottom navigation with 3 tabs:
1. **Record (Home)** - Main transcription screen
2. **Library** - Folder and note organization
3. **Settings** - AI preferences and account settings

### B. Screen Breakdown

#### Record Screen (Home)
- **Idle State:** Large centered microphone button with pulsing animation
- **Active State:** Live transcript view (top 60%) + waveform animation + stop button (bottom 40%)
- **Processing State:** Full-screen overlay with loader and "Structuring your thoughts..." message

#### Library Screen
- Search bar at top (search by title, tags, content)
- Folder/subfolder tree view with icons
- Note items showing: title, date, 2-line preview
- Long-press for multi-select and drag-to-folder

#### Note Detail View
- Editable title field in header
- "Original" toggle button (top right) to switch between original and structured text
- Scrollable text area (always editable)
- Horizontal scrolling tag bar at footer with '+' to add and 'x' to remove tags
- FAB for export/share options

#### Settings Screen
- AI Preferences section:
  - Output language selector
  - Rewrite level (low, medium, high)
  - Writing style (free text input)
  - Output length (max characters)
  - Special words (comma-separated list)
- Account section:
  - Subscription status (Free/Paid)
  - Storage usage indicator

### C. Design System

#### Color Palette (based on #2563EB Deep Blue)
- Primary: #2563EB (Deep Blue)
- Primary Light: #60A5FA
- Primary Dark: #1E40AF
- Background Light: #F8FAFC
- Background Dark: #0F172A
- Surface Light: #FFFFFF
- Surface Dark: #1E293B
- Text Light: #0F172A
- Text Dark: #F1F5F9
- Grey: #64748B

#### Typography
- Font: Inter (already in theme.dart)
- Headings: 600 weight
- Body: 400 weight
- Labels: 500 weight

#### Spacing
- Use AppSpacing from theme.dart
- Generous whitespace between elements

## 4. Feature Implementation (UI Only - No Logic)

### Phase 1: Core UI Components
1. Update theme.dart with new color palette
2. Create bottom navigation scaffold
3. Implement Record screen (all 3 states)
4. Implement Library screen with folder structure
5. Implement Note detail view
6. Implement Settings screen

### Phase 2: Visual Elements
1. Microphone button with pulsing animation
2. Waveform animation component
3. Folder/subfolder tree UI
4. Tag chip components
5. Warning banners (battery, storage)
6. Export/share bottom sheet

### Phase 3: Polish
1. Add smooth transitions between states
2. Implement haptic feedback placeholders
3. Add loading states and skeletons
4. Final styling and spacing adjustments

## 5. Data Models (Future Implementation)
- User model
- Note model (id, title, originalText, structuredText, tags, folderId, createdAt, updatedAt)
- Folder model (id, name, parentId, createdAt)
- Settings model (AIPreferences, subscription)

## 6. Services (Future Implementation)
- TranscriptionService
- TextStructuringService
- NoteService
- FolderService
- SettingsService
- ExportService

## 7. Current Phase
**Phase: UI Implementation Only**
- Build all screens and components
- No functional logic, data flow, or backend integration
- Focus on beautiful, modern, minimalist design
