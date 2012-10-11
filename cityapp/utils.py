from unidecode import unidecode
import os
import re
from django.core.files.storage import FileSystemStorage

def convert_name(name):
    ascii_name = unidecode(name.replace(" ", "_")).lower().replace(" ","-")
    return re.sub('-_','_',ascii_name)

class ASCIIFileSystemStorage(FileSystemStorage):
    """
    Convert unicode characters in name to ASCII characters.
    """
    def get_valid_name(self, name):
        print 'It is called'
        return unidecode(name)

    def get_available_name(self, name):
        dir_name, file_name = os.path.split(name)
        file_root, file_ext = os.path.splitext(file_name)
        name = os.path.join(dir_name, "%s%s" % (convert_name(file_root), file_ext))
        return name

    def _save(self, name, content):
        if self.exists(name):
            self.delete(name)
        return super(ASCIIFileSystemStorage, self)._save(name, content)
