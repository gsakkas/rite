
let change x =
  let rec changehelper acc x =
    match x with | [] -> [] | hd::tl -> changehelper (acc ^ hd) tl in
  changehelper "" x;;

let _ =
  change
    [1;
    9;
    4;
    5;
    2;
    3;
    7;
    4;
    8;
    1;
    2;
    9;
    5;
    8;
    1;
    0;
    0;
    5;
    4;
    6;
    7;
    9;
    1;
    2;
    0;
    3;
    9];;
