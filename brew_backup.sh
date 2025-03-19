#!/bin/bash

# Homebrew 설치 확인 및 설치
if ! command -v brew &>/dev/null; then
    echo "Homebrew가 설치되어 있지 않습니다. 설치를 시작합니다."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew가 이미 설치되어 있습니다."
fi

# Brew 업데이트 및 정리
echo "Homebrew 업데이트 중..."
brew update
brew upgrade

# Brewfile 생성 및 앱 설치
BREWFILE=~/Brewfile
cat <<EOL > $BREWFILE
tap "homebrew/cask"

# 주로 사용하는 앱
cask "visual-studio-code" # 코드 및 문서 편집
cask "obsidian"           # 메모 및 문서 관리
cask "slack"              # 팀 커뮤니케이션
cask "arc"                # 웹 브라우저
cask "iterm2"             # 터미널 대체
cask "warp"               # 현대적 터미널
cask "wireshark"          # 네트워크 패킷 분석
cask "runcat"             # CPU 상태 모니터링
cask "fork"               # Git 클라이언트
cask "appcleaner"         # 앱 삭제 시 임시 파일 정리
cask "terminus"           # 크로스 플랫폼 터미널
cask "gifski"             # GIF 변환 도구
cask "figma"              # 디자인 및 프로토타이핑

# 클라우드 스토리지
cask "google-drive"       # 구글 드라이브 동기화
cask "dropbox"           # 드롭박스 동기화

# 유틸리티
cask "rectangle"          # 창 관리
cask "iina"               # 동영상 플레이어
cask "vlc"                # 멀티미디어 파일 재생
EOL

echo "앱 설치를 시작합니다..."
brew bundle --file=$BREWFILE

# 정리 작업
brew cleanup
echo "설치 완료."

