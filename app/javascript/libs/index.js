// アプリーケーション全体で利用するライブラリを導入する
// このディレクトリにある.jsファイルはすべて読み込まれる

const libs = require.context('.', true, /\.js$/)
libs.keys().forEach(libs)
