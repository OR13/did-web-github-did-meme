echo 
echo "Installing ✨ "$1
echo 

DID_MEME=$1
curl -s https://didme.me/api/$DID_MEME | jq '.' > parent.json
ID=$(cat ./parent.json | jq -r '.didDocument.id | split(":")[2]')
USERNAME=$(gh repo view --json url | jq -r  '.url | split("/")[3]')
DID_WEB="did:web:$USERNAME.github.io:memes:$ID"
mkdir -p ./docs/memes/$ID
mv ./parent.json ./docs/memes/$ID/parent.json
cat ./docs/memes/$ID/parent.json | jq '.didDocument' | sed "s/$DID_MEME/$DID_WEB/g"  > ./docs/memes/$ID/did.json
echo
echo "1. say buh bye to 🔥 $DID_MEME"
echo
echo "2. say wassup to  🌴 $DID_WEB"
echo