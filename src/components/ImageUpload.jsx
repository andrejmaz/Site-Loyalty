import { useState } from 'react';

/**
 * Компонент для загрузки изображения
 */
const ImageUpload = ({ label, onChange, accept = 'image/*', required = false }) => {
    const [preview, setPreview] = useState(null);
    const [file, setFile] = useState(null);

    const handleFileChange = (e) => {
        const selectedFile = e.target.files[0];
        if (selectedFile) {
            setFile(selectedFile);
            
            const reader = new FileReader();
            reader.onload = (e) => {
                setPreview(e.target.result);
            };
            reader.readAsDataURL(selectedFile);
            
            if (onChange) {
                onChange(selectedFile);
            }
        }
    };

    const handleRemove = () => {
        setPreview(null);
        setFile(null);
        if (onChange) {
            onChange(null);
        }
    };

    return (
        <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">{label}<span className="text-red-500">{required && ' *'}</span></label>
            
            {!preview ? (
                <div className="upload-area border-2 border-dashed border-gray-300 rounded-lg p-6 text-center hover:border-black transition-colors cursor-pointer">
                    <input 
                        type="file" 
                        accept={accept} 
                        className="hidden" 
                        onChange={handleFileChange}
                        id={`upload-${label}`}
                    />
                    <label htmlFor={`upload-${label}`} className="cursor-pointer">
                        <svg className="w-12 h-12 mx-auto text-gray-400 mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                        </svg>
                        <p className="text-gray-600">Нажмите для загрузки фото</p>
                    </label>
                </div>
            ) : (
                <div className="mt-3">
                    <img src={preview} alt="Preview" className="w-full h-48 object-cover rounded-lg" />
                    <button 
                        type="button" 
                        onClick={handleRemove}
                        className="mt-2 text-red-500 text-sm hover:text-red-700 transition-colors"
                    >
                        Удалить фото
                    </button>
                </div>
            )}
        </div>
    );
};

export default ImageUpload;
