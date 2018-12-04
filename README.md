a script to upgrade a program and re-start it.

# how to use
step 1: upload an newer program to server, and rename it another name you liked but don't same as the running program name.<br>
for example, a running program that called 'party', advice the newer one be called 'party.new':<br>
`scp ./party who@server:/where/party.new`

step 2: edit deploy.sh:<br>
change 'party' at line 2 `tarname="party"` to your program name `tarname="program"`.<br>
if name of you uploaded program that newer one is other than '<program>.new', you may change line3 `oriname="$tarname.new"` to you want.

step 3: deploy<br>
`./deploy.sh`

# options
-o|--origin=oriname: indicate which file to upgrade. if set, ignore $oriname in sh. <br>
-t|--target=tarname: indicate which file to be upgrade. if set, ignore $tarname in sh. <br>
-k|--keeplog: if set, keep *.log those saved before.

# sorry my poor english.
