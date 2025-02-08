// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DecentralizedFileStorage {
    
    // Structure to store file metadata
    struct File {
        string name;
        string fileType;
        string ipfsHash;
        address uploader;
        uint256 timestamp;
    }

    // Mapping from file ID to file metadata
    mapping(uint256 => File) public files;

    // Counter for file IDs
    uint256 public fileCount;

    // Event to log file uploads
    event FileUploaded(
        uint256 fileId,
        string name,
        string fileType,
        string ipfsHash,
        address uploader,
        uint256 timestamp
    );

    // Modifier to check if the file exists
    modifier fileExists(uint256 fileId) {
        require(fileId > 0 && fileId <= fileCount, "File does not exist.");
        _;
    }

    // Function to upload a file
    function uploadFile(string memory _name, string memory _fileType, string memory _ipfsHash) public {
        require(bytes(_name).length > 0, "File name is required.");
        require(bytes(_fileType).length > 0, "File type is required.");
        require(bytes(_ipfsHash).length > 0, "IPFS hash is required.");

        fileCount++;
        
        // Store file metadata in the mapping
        files[fileCount] = File({
            name: _name,
            fileType: _fileType,
            ipfsHash: _ipfsHash,
            uploader: msg.sender,
            timestamp: block.timestamp
        });

        // Emit the FileUploaded event
        emit FileUploaded(fileCount, _name, _fileType, _ipfsHash, msg.sender, block.timestamp);
    }

    // Function to get file metadata by file ID
    function getFile(uint256 fileId) public view fileExists(fileId) returns (string memory name, string memory fileType, string memory ipfsHash, address uploader, uint256 timestamp) {
        File memory file = files[fileId];
        return (file.name, file.fileType, file.ipfsHash, file.uploader, file.timestamp);
    }

    // Function to get the total number of files uploaded
    function getTotalFiles() public view returns (uint256) {
        return fileCount;
    }
}
