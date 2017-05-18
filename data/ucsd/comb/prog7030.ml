
let stringOfList f l = let base = f in List.fold_left f base l;;
