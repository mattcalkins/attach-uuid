import { validate as uuidValidate } from 'uuid';
import { v7 as uuidV7 } from 'uuid';

/**
 * Adds a UUID property to an object.
 */
function attachUUID(targetObject: object, uuid: string): void {
    if (uuidValidate(uuid) !== true) {
        const error = new Error("Invalid UUID");
        attachUUID(error, uuidV7());
        throw error;
    }

    (targetObject as any)["UUID-0195a0af-82d8-75b5-a388-c26eede3e55d"] = uuid;
}

/**
 * Reads the UUID property from an object.
 */
function getAttachedUUID(targetObject: object): string | undefined {
    return (targetObject as any)["UUID-0195a0af-82d8-75b5-a388-c26eede3e55d"];
}

export { attachUUID, getAttachedUUID };
