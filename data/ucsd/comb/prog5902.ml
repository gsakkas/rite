
let rec sumList xs = match xs with | o -> o | h::xs' -> h + (sumList xs');;
