import React, { useState } from 'react';
import { backend_canister } from 'declarations/backend_canister';

const RepositoryCreator = () => {
  const [name, setName] = useState('');
  const [description, setDescription] = useState('');
  const [status, setStatus] = useState('');

  const handleSubmit = async () => {
    try {
      setStatus('Creating repository...');
      
      // Call backend function
      const repoId = await backend_canister.create_repository(name, description);
      
      setStatus(`Repository created with ID: ${repoId}`);
    } catch (error) {
      setStatus(`Error: ${error.message}`);
      console.error('Failed to create repository:', error);
    }
  };

  return (
    <div className="repository-form">
      <h2>Create New Repository</h2>
      <input
        type="text"
        placeholder="Repository Name"
        value={name}
        onChange={(e) => setName(e.target.value)}
      />
      <textarea
        placeholder="Description"
        value={description}
        onChange={(e) => setDescription(e.target.value)}
      />
      <button onClick={handleSubmit}>Create Repository</button>
      {status && <p>{status}</p>}
    </div>
  );
};

export default RepositoryCreator;
