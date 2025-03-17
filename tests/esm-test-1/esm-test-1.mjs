import { attachUUID, getAttachedUUID } from 'attach-uuid';
import { v7 as uuidV7 } from 'uuid';

const error = new Error('This is an error');
const uuid = uuidV7();

attachUUID(error, uuid);

const attachedUUID = getAttachedUUID(error);

if (attachedUUID !== uuid) {
    throw new Error('UUIDs do not match');
}

console.log('esm-test-1.mjs: Success');
