import { build } from 'esbuild';

build({
    bundle: true,
    entryPoints: ['src/index.ts'],
    format: 'esm',
    minify: true,
    outfile: 'dist/esm-browser/index.js',
    platform: 'browser',
    sourcemap: true
}).catch(() => process.exit(1));
