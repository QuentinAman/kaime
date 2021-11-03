<script>
import Input from "./Input.svelte";
export let value = "";
export let options = [];
export let placeholder = "";

$: filtered = options.filter(v => new RegExp(value, "gi").test(v));

</script>

<Input bind:value icon="Cross" options={filtered} onIconClick={() => value = ""} {placeholder}/>