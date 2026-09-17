#!/usr/bin/env node
const { spawn } = require('child_process');

const defaultUrl = 'http://localhost:3000';
process.env.VITE_OTA_API_URL = process.env.VITE_OTA_API_URL || defaultUrl;

const child = spawn('vite', [], { stdio: 'inherit', shell: true });
child.on('close', code => process.exit(code));
