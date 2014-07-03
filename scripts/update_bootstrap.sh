#!/bin/bash

bs_dir='./twitter/bootstrap'
lrb_dir='.'

lrb_assets_dir="$lrb_dir/app/assets"
lrb_font_dir="$lrb_assets_dir/fonts/twitter/bootstrap"
lrb_js_dir="$lrb_assets_dir/javascripts/twitter/bootstrap"
lrb_styles_dir="$lrb_assets_dir/stylesheets/twitter"

lrb_bootstrap_js="$lrb_assets_dir/javascripts/twitter/bootstrap.js"
lrb_bootstrap_less="$lrb_assets_dir/stylesheets/twitter/bootstrap.less"

lrb_frameworks_dir="$lrb_dir/app/frameworks"
lrb_fw_dir="$lrb_frameworks_dir/twitter/bootstrap"

error() {
echo -e -n "\033[1;31m$1"
echo -e '\033[0m'
}

success() {
echo -e -n "\033[1;32m$1"
echo -e '\033[0m'
}

info() {
echo -e -n "\033[1;34m$1"
echo -e '\033[0m'
}

if [ $# -ne 1 ] 
then
error "USAGE: $0 <bootstrap version>"
exit 1
fi

if [ ! -d $bs_dir ]; then
    info "Bootstrap not found. Cloning to twitter/bootstrap..."
    git clone --quiet git://github.com/twbs/bootstrap.git twitter/bootstrap
else
    info "Bootstrap found. Fetching to twitter/bootstrap..."
    cd $bs_dir
    git fetch
    cd - > /dev/null
fi

cd twitter/bootstrap
info "Using $1..."
git checkout --quiet $1
cd ../../

info "Remove $lrb_assets_dir directory..."
rm -rf $lrb_assets_dir

info "Remove $lrb_frameworks_dir directory..."
rm -rf $lrb_frameworks_dir

info "Copying fonts..."
# fonts
mkdir -p $lrb_font_dir/
for f in $bs_dir/fonts/*; do
    bn=$(basename $f)
    cp $f $lrb_font_dir/$bn
done

info "Copying scripts..."
# scripts
mkdir -p $lrb_js_dir/
for f in $bs_dir/js/*.js; do
    bn=$(basename $f)
    cp $f $lrb_js_dir/${bn/bootstrap-/}
done

info "Copying styles..."
# styles
mkdir -p $lrb_fw_dir
for f in $bs_dir/less/{,**/}*.less; do
    bn=${f/\.\/twitter\/bootstrap\/less\//}
    mkdir -p $lrb_fw_dir/$(dirname $bn)
    cp $f $lrb_fw_dir/$bn
done

info "Apply patches..."
[[ $(uname -s) == 'Darwin' ]] && ioption=(-i "") || ioption=(-i)
sed "${ioption[@]}" 's#^\(@icon-font-path:[[:space:]]*\"\).*\(\";\)#\1twitter/bootstrap/\2#g' $lrb_fw_dir/variables.less
sed "${ioption[@]}" 's# ~"url(\(.*\))"# asset-url(\1)#g' $lrb_fw_dir/{,**/}*.less
sed "${ioption[@]}" 's# url(# asset-url(#g' $lrb_fw_dir/{,**/}*.less

info "Generate bootstrap.js..."
sed -n "s#.*'js/\([a-z]\{1,\}\.js\)'.*#//= require twitter/bootstrap/\1#p" twitter/bootstrap/Gruntfile.js >> $lrb_bootstrap_js

info "Generate bootstrap.css.less..."
mkdir -p $lrb_styles_dir
echo "@import \"twitter/bootstrap/bootstrap\";" >> $lrb_bootstrap_less

success "Done"
