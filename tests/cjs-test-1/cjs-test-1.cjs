const { attachUUID, getAttachedUUID } = require('attach-uuid');
const { v7: uuidV7 } = require('uuid');

const error = new Error('This is an error');
const uuid = uuidV7();

attachUUID(error, uuid);

const attachedUUID = getAttachedUUID(error);

if (attachedUUID !== uuid) {
    throw new Error('UUIDs do not match');
}

console.log('cjs-test-1.cjs: Success');
