<script>
  import { Template, Meta, Story } from '@storybook/addon-svelte-csf';
  import InputSearch from '../lib/components/InputSearch.svelte';
</script>

<Meta title="Components/InputSearch" component={InputSearch} />

<Template let:args>
  <InputSearch {...args} />
</Template>

<Story name="Default" args={
  { 
    options: ["Maxime", "Quentin", "Rudy", "Guillaume", "Sébastien"],
    placeholder: "Placeholder"
  }
} />