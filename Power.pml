proctype power(int a; int n; chan p){	
	chan child = [1] of { int };
	int result;
	if
	:: (n == 0) -> p!1
	:: (n >= 1) ->
		run power(a, n-1, child);
		child?result;
		p!a*result
	fi
}

init {	
	chan child = [1] of { int };
	int result;
	run power(2, 8, child);
	child?result;
	printf("result: %d\n", result)
}
