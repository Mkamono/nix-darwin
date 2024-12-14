# darwin configuration
{ pkgs, ... }: {
  # システムにインストールするパッケージ
  environment.systemPackages = with pkgs; [
    git
    nil # nix language server
    nixfmt # https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-fmt#examples
  ];

  # Nixデーモンの自動アップグレードを有効化
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  # 非自由パッケージを許可
  nixpkgs.config.allowUnfree = true;

  system.defaults.finder = {
    # 全てのファイル拡張子を表示: trueにすると、すべてのファイルの拡張子が表示されます。
    AppleShowAllExtensions = true;

    # 隠しファイルを表示: trueにすると、通常は非表示のファイル（.で始まるファイル）も表示されます。
    AppleShowAllFiles = true;

    # デスクトップアイコンの非表示: falseにすると、デスクトップ上のアイコンが非表示になります。
    CreateDesktop = false;

    # 拡張子変更時の警告を無効化: falseにすると、ファイル拡張子を変更する際の警告が表示されなくなります。
    FXEnableExtensionChangeWarning = false;

    # パスバーを表示: trueにすると、Finderウィンドウの下部にファイルパスが表示されます。
    ShowPathbar = true;

    # ステータスバーを表示: trueにすると、Finderウィンドウの下部に選択したアイテムの情報が表示されます。
    ShowStatusBar = true;
  };

  # Dock設定
  system.defaults.dock = {
    # Dockの自動非表示: trueの場合、Dockを自動で隠します。
    autohide = true;

    # 最近使用したアプリケーションの非表示: falseにすると、Dockに最近のアプリが表示されなくなります。
    show-recents = false;

    # Dockアイコンのサイズ: ピクセル単位でアイコンサイズを設定します。
    tilesize = 50;

    # Dockアイコンの拡大機能: trueにすると、マウスオーバー時にアイコンが拡大表示されます。
    magnification = true;

    # 拡大時のアイコンサイズ: マウスオーバー時のアイコンサイズをピクセル単位で設定します。
    largesize = 64;

    # Dockの位置: "bottom"、"left"、"right"のいずれかを指定できます。
    orientation = "bottom";

    # ウィンドウ最小化エフェクト: "scale"は縮小エフェクトを使用します。
    mineffect = "scale";

    # アプリケーション起動時のアニメーションを無効化: falseにすると、起動アニメーションが表示されなくなります。
    launchanim = false;
  };
}
