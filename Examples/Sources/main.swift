import UniqNameGenDbFriendly

func main(){
    let nsrc: UniqNameGenDbFriendly.NameSource = UniqNameGenDbFriendly.nameSrcDateDefaultNew()
    let name: String = nsrc.getName()
    print(name)
}

main()
