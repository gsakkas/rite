
let sqsum xs =
  let f a x = let a::x = xs in a * a in
  let base = 0 in
  List.fold_left f base xs UNCOMMENT AFTER IMPLEMENTING THE ABOVE;;
