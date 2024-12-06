(*print list for debug purpose*)
let print_data_from_list data =
	let rec print_list lst =
		if lst = [] then ()
		else
			let (login,pwd) = List.hd lst in
			print_endline("Login: "^ login ^ ",Password:" ^ pwd);
			print_list(List.tl lst)
		in
		print_list data;;

(*print list created from reading file, for debug purpose*)
let print_data_from_file file =
	let data = Tools.read_data_from_file file in
	print_data_from_list data;;

(*create two list using file names then concatenate them into a new one *)
let concatenate_lists file1 file2 =
	let list1 = Tools.read_data_from_file file1 in
	let list2 = Tools.read_data_from_file file2 in
	let list3 = list1@list2 in
	list3;;
	
	
	
(*fuse two lists and eliminate redundant from two lists*)
let fuse_and_remove_duplicates file1 file2 =
	let wholelist = concatenate_lists file1 file2 in
	let newlist = [] in
	let i = 0 in
	while(i < List.length wholelist) do
		if List.exists (newlist, List.hd wholelist) then ()
		else
			newlist :: List.hd wholelist;
	done;
	newlist;;
