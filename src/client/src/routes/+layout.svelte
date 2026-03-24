<script lang="ts">
	import favicon from '$lib/assets/favicon.ico';
	import logo from "$lib/assets/logo.png"

	let { children } = $props();
</script>

<svelte:head>
	<link rel="icon" href={favicon} />
	<title>abysm.dev</title>
</svelte:head>

<header>
    <a href="/">
		<img src={logo} alt="abysm.dev" width=200>
	</a>
		
	<a href="/game">
		<h3>Game</h3>
	</a>
</header>

{@render children()}
