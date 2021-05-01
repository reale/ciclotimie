PATH="/home/roberto/git/ciclotimie/bin:/home/roberto/git/ciclotimie/bin:/home/roberto/git/ciclotimie/bin:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:/usr/local/texlive/2019/bin/x86_64-linux/:/home/roberto/.local/bin:/home/roberto/bin:/home/roberto/go/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/var/lib/snapd/snap/bin"
mkdir -p "./all_pdf/logs"
mkdir -p "./all_pdf/tex"
cp book.tex   "./all_pdf"
cp -R ./tex/*        "./all_pdf/tex"
cp "setParameters.bash" "./all_pdf"
rm 'setParameters.bash'
cp "BookParameters.tex" "./all_pdf"
cd "./all_pdf"
